final class LowShelfEqualizerVM: BaseNodeVM {

	let filter: AKLowShelfFilter

	init(input: AKNode) {
		self.filter = AKLowShelfFilter(input)

		super.init(title: "Low Shelf Filter", input: input, output: self.filter)

		self.filter.cutoffFrequency = 80
		self.filter.gain = 0

		self.nodes = [self.filter]
	}

}
