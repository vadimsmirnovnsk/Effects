final class DelayVM: BaseNodeVM {

	let delay: AKDelay

	init(input: AKNode?) {
		self.delay = AKDelay(input)

		super.init(title: "Delay", input: input, output: self.delay)

		self.delay.dryWetMix = 0.5
		self.delay.feedback = 0.9
		self.delay.time = 0.3

		self.nodes = [self.delay]
	}

}
