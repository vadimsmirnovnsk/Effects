final class LowShelfEqualizerVM: BaseNodeVM {

	let equalizer: AKLowShelfFilter

	init(input: AKNode) {
		self.equalizer = AKLowShelfFilter(input)

		super.init(title: "Low Shelf Filter", input: input, output: self.equalizer)

		self.equalizer.cutoffFrequency = 80
		self.equalizer.gain = 0
	}

}
