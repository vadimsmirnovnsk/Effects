final class DynamicProcessorView: BaseNodeView<DynamicProcessorVM> {

	private let threshold: AKSlider
	private let headroom: AKSlider
	private let expansionRatio: AKSlider
	private let expansionThreshold: AKSlider
	private let attackDuration: AKSlider
	private let releaseDuration: AKSlider
	private let masterGain: AKSlider

	required init(viewModel: DynamicProcessorVM) {
		self.threshold = EffectSlider(property: "Threshold",
									  value: viewModel.processor.threshold,
									  range: -40 ... 20,
									  format: "%0.2f dB"
		) { viewModel.processor.threshold = $0 }

		self.headroom = EffectSlider(property: "Headroom",
									 value: viewModel.processor.headRoom,
									 range: 0.1 ... 40,
									 format: "%0.2f dB"
		) { viewModel.processor.headRoom = $0 }

		self.expansionRatio = EffectSlider(property: "Expansion Ratio",
									 value: viewModel.processor.expansionRatio,
									 range: 1 ... 50
		) { viewModel.processor.expansionRatio = $0 }

		self.expansionThreshold = EffectSlider(property: "Expansion Threshold",
										   value: viewModel.processor.expansionThreshold,
										   range: 1 ... 50
		) { viewModel.processor.expansionThreshold = $0 }

		self.attackDuration = EffectSlider(property: "Attack Duration",
										   value: viewModel.processor.attackDuration,
										   range: 0.000_1 ... 0.2,
										   format: "%0.3f s"
		) { viewModel.processor.attackDuration = $0 }

		self.releaseDuration = EffectSlider(property: "Release Duration",
											value: viewModel.processor.releaseDuration,
											range: 0.01 ... 3,
											format: "%0.3f s"
		) { viewModel.processor.releaseDuration = $0 }

		self.masterGain = EffectSlider(property: "Master Gain",
									   value: viewModel.processor.masterGain,
									   range: -40 ... 40,
									   format: "%0.2f dB"
		) { viewModel.processor.masterGain = $0 }

		super.init(viewModel: viewModel)

		self.stack.addArrangedSubviews([
			self.threshold,
			self.headroom,
			self.expansionRatio,
			self.expansionThreshold,
			self.attackDuration,
			self.releaseDuration,
			self.masterGain
		])
	}

}

