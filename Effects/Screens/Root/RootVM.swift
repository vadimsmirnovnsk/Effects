import VNBase
import AudioKit

final class RootVM: BaseViewControllerVM {

	let micVM = MicVM()
	let outputVM: OutputVM

	override init() {
		self.outputVM = OutputVM(input: self.micVM.output)

		super.init()
	}

	override func load() {
		super.load()

		AKSettings.audioInputEnabled = true
		AudioKit.output = self.outputVM.output

		do {
			try AudioKit.start()
		} catch {
			AKLog("AudioKit did not start!")
		}
	}

}
