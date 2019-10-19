final class ReverbVM: BaseNodeVM {

	let reverb: AKReverb

	init(input: AKNode?) {
		self.reverb = AKReverb(input)

		super.init(title: "Reverb", input: input, output: self.reverb)

		self.reverb.dryWetMix = 0.2
		self.reverb.loadFactoryPreset(.mediumHall)

		self.nodes = [self.reverb]
	}

}
