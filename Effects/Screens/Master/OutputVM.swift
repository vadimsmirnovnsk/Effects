final class OutputVM: BaseNodeVM {

	let booster: AKBooster

	init(input: AKNode) {
		self.booster = AKBooster(input, gain: 1)

		super.init(title: "Master Volume", input: input, output: self.booster)
	}

}
