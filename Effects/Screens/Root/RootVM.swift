import VNBase
import AudioKit

final class RootVM: BaseViewControllerVM {

	let oscillator = AKOscillator()
	let oscillator2 = AKOscillator()

	override init() {
		super.init()
	}

	override func load() {
		super.load()

		AudioKit.output = AKMixer(self.oscillator, self.oscillator2)
		try? AudioKit.start()
	}

	func didTapB1() {
		if self.oscillator.isPlaying {
			self.oscillator.stop()
		} else {
			self.oscillator.amplitude = random(in: 0.5...1)
			self.oscillator.frequency = random(in: 220...880)
			self.oscillator.start()
		}
	}

	func didTapB2() {
		if self.oscillator2.isPlaying {
			self.oscillator2.stop()
		} else {
			self.oscillator2.amplitude = random(in: 0.5...1)
			self.oscillator2.frequency = random(in: 220...880)
			self.oscillator2.start()
		}
	}

}
