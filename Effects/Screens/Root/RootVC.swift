import VNBase
import AudioKit
import AudioKitUI

final class RootVC: BaseVC<RootVM> {

	private let scroll = UIScrollView()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.addSubview(self.scroll) { make in
			make.edges.equalToSuperview()
		}

		let b1 = BlockButton { [weak self] _ in self?.viewModel.didTapB1() }
		let b2 = BlockButton { [weak self] _ in self?.viewModel.didTapB2() }

		b1.setTitleColor(.blue, for: .normal)
		b2.setTitleColor(.blue, for: .normal)
		b1.setTitle("Oscillator 1", for: .normal)
		b2.setTitle("Oscillator 2", for: .normal)

		self.scroll.addSubview(b1) { make in
			make.left.right.equalTo(self.view)
			make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
			make.height.equalTo(60)
		}

		self.scroll.addSubview(b2) { make in
			make.left.right.equalTo(self.view)
			make.top.equalTo(b1.snp.bottom).offset(24)
			make.height.equalTo(60)
		}
	}

}
