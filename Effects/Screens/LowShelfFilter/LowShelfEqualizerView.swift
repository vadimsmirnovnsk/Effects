final class LowShelfEqualizerView: BaseNodeView<LowShelfEqualizerVM> {

	private let cutoff: AKSlider
	private let gain: AKSlider

	required init(viewModel: LowShelfEqualizerVM) {
		self.cutoff = EffectSlider(property: "Cutoff Frequency",
								   value: viewModel.filter.cutoffFrequency,
								   range: 10 ... 200,
								   format: "%0.1f Hz",
								   color: .rightProgressGreen
		) { viewModel.filter.cutoffFrequency = $0 }

		self.gain = EffectSlider(property: "Gain",
							 value: viewModel.filter.gain,
							 range: -40 ... 40,
							 format: "%0.1f dB",
							 color: .leftProgressGreen
		) { viewModel.filter.gain = $0 }

		super.init(viewModel: viewModel)

		self.stack.addArrangedSubviews([
			self.gain,
			self.cutoff,
		])
	}

}
