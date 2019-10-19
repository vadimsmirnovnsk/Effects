final class DelayVM: BaseNodeVM {

	let delay: AKDelay

	init(input: AKNode?) {
		self.delay = AKDelay(input)

		super.init(title: "Delay", input: input, output: self.delay)

		self.delay.dryWetMix = 0.3
		self.delay.feedback = 0.25
		self.delay.time = 0.18
		self.delay.lowPassCutoff = 3270

		self.nodes = [self.delay]
	}

}
