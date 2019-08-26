final class LowShelfEqualizerView: BaseNodeView<LowShelfEqualizerVM> {

	private let cutoff: AKSlider
	private let gain: AKSlider

	required init(viewModel: LowShelfEqualizerVM) {
		self.cutoff = AKSlider(property: "Cutoff Frequency",
							   value: viewModel.equalizer.cutoffFrequency,
							   range: 10 ... 200,
							   format: "%0.1f Hz"
		) { sliderValue in
			viewModel.equalizer.cutoffFrequency = sliderValue
		}
		self.cutoff.color = .rightProgressGreen

		self.gain = AKSlider(property: "Gain",
							 value: viewModel.equalizer.gain,
							 range: -40 ... 40,
							 format: "%0.1f dB"
		) { sliderValue in
			viewModel.equalizer.gain = sliderValue
		}
		self.gain.color = .leftProgressGreen

		super.init(viewModel: viewModel)

		self.stack.addArrangedSubviews([
			self.gain,
			self.cutoff,
		])

		self.gain.snp.makeConstraints { make in
			make.height.equalTo(44)
		}

		self.cutoff.snp.makeConstraints { make in
			make.height.equalTo(44)
		}
	}

}
