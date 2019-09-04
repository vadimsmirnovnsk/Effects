import VNBase
import AudioKit

final class RootVM: BaseViewControllerVM {

	let micVM = MicVM()

	let lowShelf: LowShelfEqualizerVM
	let equalizer: EqualizerVM
	let compressor: CompressorVM
	let dynamicsProcessor: DynamicProcessorVM
	let delayVM: DelayVM
	let reverbVM: ReverbVM
	let outputVM: OutputVM

	var all: [BaseNodeVM] = []

	override init() {
		self.lowShelf = LowShelfEqualizerVM(input: self.micVM.output)

		self.equalizer = EqualizerVM(input: self.lowShelf.output,
									 equalizer: EqualizerBand.thirdOctaveEqualizer)
		self.compressor = CompressorVM(input: self.equalizer.output)
		self.dynamicsProcessor = DynamicProcessorVM(input: self.compressor.output)
		self.delayVM = DelayVM(input: self.dynamicsProcessor.output)
		self.reverbVM = ReverbVM(input: self.delayVM.output)

		self.outputVM = OutputVM(input: self.reverbVM.output)

		super.init()

		self.all = [
			self.lowShelf,
			self.equalizer,
			self.compressor,
			self.dynamicsProcessor,
			self.delayVM,
			self.reverbVM,
		]
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

		self.all.forEach {
			$0.isEnabled = false
			$0.isExpanded = false
		}
	}

}
