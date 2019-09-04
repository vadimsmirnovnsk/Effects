import VNBase
import AudioKit

final class RootVM: BaseViewControllerVM {

	let micVM = MicVM()

	let lowShelf: LowShelfEqualizerVM
	let equalizer: EqualizerVM
	let compressor: CompressorVM
	let dynamicsProcessor: DynamicProcessorVM
	let outputVM: OutputVM

	override init() {
		self.lowShelf = LowShelfEqualizerVM(input: self.micVM.output)

		self.equalizer = EqualizerVM(input: self.lowShelf.output,
									 equalizer: EqualizerBand.thirdOctaveEqualizer)
		self.compressor = CompressorVM(input: self.equalizer.output)
		self.dynamicsProcessor = DynamicProcessorVM(input: self.compressor.output)

		self.outputVM = OutputVM(input: self.dynamicsProcessor.output)

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
