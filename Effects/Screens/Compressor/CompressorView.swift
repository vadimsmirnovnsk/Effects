final class CompressorView: BaseNodeView<CompressorVM> {

	private let threshold: AKSlider
	private let headroom: AKSlider
	private let attackDuration: AKSlider
	private let releaseDuration: AKSlider
	private let masterGain: AKSlider

	required init(viewModel: CompressorVM) {
		self.threshold = EffectSlider(property: "Threshold",
								  value: viewModel.compressor.threshold,
								  range: -40 ... 20,
								  format: "%0.2f dB"
		) { viewModel.compressor.threshold = $0 }

		self.headroom = EffectSlider(property: "Headroom",
									  value: viewModel.compressor.headRoom,
									  range: 0.1 ... 40,
									  format: "%0.2f dB"
		) { viewModel.compressor.headRoom = $0 }

		self.attackDuration = EffectSlider(property: "Attack Duration",
										   value: viewModel.compressor.attackDuration,
										   range: 0.001 ... 0.2,
										   format: "%0.4f s"
		) { viewModel.compressor.attackDuration = $0 }

		self.releaseDuration = EffectSlider(property: "Release Duration",
										   value: viewModel.compressor.releaseDuration,
										   range: 0.01 ... 3,
										   format: "%0.3f s"
		) { viewModel.compressor.releaseDuration = $0 }

		self.masterGain = EffectSlider(property: "Master Gain",
											value: viewModel.compressor.masterGain,
											range: -40 ... 40,
											format: "%0.2f dB"
		) { viewModel.compressor.masterGain = $0 }

		super.init(viewModel: viewModel)

		self.stack.addArrangedSubviews([
			self.threshold,
			self.headroom,
			self.attackDuration,
			self.releaseDuration,
			self.masterGain
		])
	}

}
