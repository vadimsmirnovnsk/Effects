final class DelayView: BaseNodeView<DelayVM> {

	private let time: AKSlider
	private let feedback: AKSlider
	private let lowPassCutOff: AKSlider
	private let dryWetMix: AKSlider

	required init(viewModel: DelayVM) {
		self.time = EffectSlider(property: "Time",
								 value: viewModel.delay.time
		) { viewModel.delay.time = $0 }

		self.feedback = EffectSlider(property: "Feedback",
									 value: viewModel.delay.feedback
		) { viewModel.delay.feedback = $0 }

		self.lowPassCutOff = EffectSlider(property: "Low Pass Cutoff",
										   value: viewModel.delay.lowPassCutoff,
										   range: 0 ... 22_050
		) { viewModel.delay.lowPassCutoff = $0 }

		self.dryWetMix = EffectSlider(property: "Mix",
									  value: viewModel.delay.dryWetMix
		) { viewModel.delay.dryWetMix = $0 }

		super.init(viewModel: viewModel)

		self.stack.addArrangedSubviews([
			self.time,
			self.feedback,
			self.lowPassCutOff,
			self.dryWetMix
		])
	}

}
