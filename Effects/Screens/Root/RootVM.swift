import VNBase
import AudioKit

final class RootVM: BaseViewControllerVM {

	let micVM = MicVM()

	override init() {
		super.init()
	}

	override func load() {
		super.load()

		self.micVM.launch()

		AKSettings.audioInputEnabled = true
		AudioKit.output = self.micVM.micOutput

		do {
			try AudioKit.start()
		} catch {
			AKLog("AudioKit did not start!")
		}
	}

}
