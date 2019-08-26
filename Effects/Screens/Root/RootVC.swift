import VNBase
import AudioKit
import AudioKitUI

final class RootVC: BaseVC<RootVM> {

	override var navigationBarStyle: NavigationBarStyle? { return .semilightTansparent }
	override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

	private let scroll = UIScrollView()
	private let stack = UIStackView.stack()

	private let micView: MicView
	private let lowShelf: LowShelfEqualizerView
	private let masterView: OutputView

	override init(viewModel: RootVM) {
		self.micView = MicView(viewModel: viewModel.micVM)
		self.lowShelf = LowShelfEqualizerView(viewModel: viewModel.lowShelf)
		self.masterView = OutputView(viewModel: viewModel.outputVM)

		super.init(viewModel: viewModel)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.backgroundColor = .Dark

		self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Source", style: .plain, target: self, action: #selector(didTapInputDevicesButton))
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Output", style: .plain, target: self, action: #selector(didTapOutputDevicesButton))

		self.view.addSubview(self.scroll) { make in
			make.left.right.equalToSuperview()
			make.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
		}

		self.scroll.addSubview(self.stack) { make in
			make.left.right.equalTo(self.view).inset(16)
			make.top.bottom.equalToSuperview()
		}

		self.stack.addArrangedSubviews([
			self.micView,
			self.lowShelf,
			self.masterView
		])
	}

	@objc func didTapInputDevicesButton(_ sender: UIBarButtonItem) {
		let vc = self.deviceVC(with: .input)
		self.present(vc, animated: true, completion: nil)
	}

	@objc func didTapOutputDevicesButton(_ sender: UIBarButtonItem) {
		let vc = self.deviceVC(with: .output)
		self.present(vc, animated: true, completion: nil)
	}

	private func deviceVC(with style: DeviceTableViewController.Style) -> UIViewController {
		let inputDevices = DeviceTableViewController(style: style)
		inputDevices.settingsDelegate = self
		let navigationController = UINavigationController(rootViewController: inputDevices)
		navigationController.preferredContentSize = CGSize(width: 300, height: 300)
		navigationController.modalPresentationStyle = .popover
		navigationController.popoverPresentationController!.delegate = self
		return navigationController
	}

}

extension RootVC: UIPopoverPresentationControllerDelegate {

	func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
		return .none
	}

	func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
		popoverPresentationController.permittedArrowDirections = .up
		popoverPresentationController.barButtonItem = navigationItem.rightBarButtonItem
	}
}

extension RootVC: DeviceDelegate {

	func didSelectOutputDevice(_ device: AKDevice) {
		do {
			try AudioKit.setOutputDevice(device)
		} catch {
			AKLog("Error setting input device")
		}
	}


	func didSelectInputDevice(_ device: AKDevice) {
		do {
			try self.viewModel.micVM.mic?.setDevice(device)
		} catch {
			AKLog("Error setting input device")
		}
	}

}
