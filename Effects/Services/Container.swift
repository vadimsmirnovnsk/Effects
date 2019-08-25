import AudioKit

final class Container {

	init() {
		AKSettings.sampleRate = AudioKit.engine.inputNode.inputFormat(forBus: 0).sampleRate
	}

	func rootVC() -> UIViewController {
		let vc = RootVC(viewModel: RootVM())
		let nc = UINavigationController(rootViewController: vc)
		return nc
	}

}
