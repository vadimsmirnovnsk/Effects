final class ReverbVM: BaseNodeVM {

	let reverb: AKReverb

	init(input: AKNode?) {
		self.reverb = AKReverb(input)

		super.init(title: "Reverb", input: input, output: self.reverb)

		self.reverb.dryWetMix = 0.5

		self.nodes = [self.reverb]
	}

}
