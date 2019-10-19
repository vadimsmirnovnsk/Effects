final class FlangerView: BaseNodeView<FlangerVM> {

	private let rampDuration: AKSlider
	private let frequency: AKSlider
	private let depth: AKSlider
	private let feedback: AKSlider
	private let dryWetMix: AKSlider

	required init(viewModel: FlangerVM) {
		self.rampDuration = EffectSlider(property: "Ramp Duration",
										 value: viewModel.flanger.rampDuration
		) { viewModel.flanger.rampDuration = $0 }

		self.frequency = EffectSlider(property: "Frequency",
									 value: viewModel.flanger.frequency,
									 range: 0 ... 2
		) { viewModel.flanger.frequency = $0 }

		self.depth = EffectSlider(property: "Depth",
								  value: viewModel.flanger.depth
		) { viewModel.flanger.depth = $0 }

		self.feedback = EffectSlider(property: "Feedback",
									value: viewModel.flanger.feedback
		) { viewModel.flanger.feedback = $0 }

		self.dryWetMix = EffectSlider(property: "Mix",
									  value: viewModel.flanger.dryWetMix
		) { viewModel.flanger.dryWetMix = $0 }

		super.init(viewModel: viewModel)

		self.stack.addArrangedSubviews([
			self.rampDuration,
			self.frequency,
			self.depth,
			self.feedback,
			self.dryWetMix
		])
	}

}
