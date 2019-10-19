final class FlangerVM: BaseNodeVM {

	let flanger: AKFlanger

	init(input: AKNode?) {
		self.flanger = AKFlanger(input)

		super.init(title: "Flanger", input: input, output: self.flanger)

		self.flanger.rampDuration = 0.1
		self.flanger.frequency = 3.5
		self.flanger.depth = 0.5
		self.flanger.feedback = 0.45
		self.flanger.dryWetMix = 0.7

		self.nodes = [self.flanger]
	}

}

