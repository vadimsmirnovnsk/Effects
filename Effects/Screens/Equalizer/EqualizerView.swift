final class EqualizerView: BaseNodeView<EqualizerVM> {

	private let bandSliders: [AKSlider]

	required init(viewModel: EqualizerVM) {
		self.bandSliders = viewModel.bands.map { band in
			let format = band.centerFrequency >= 1000 ? "%0.1f kHz" : "%0.f Hz"
			let value = band.centerFrequency >= 1000 ? band.centerFrequency / 1000 : band.centerFrequency
			let property = String(format: format, value)
			return EffectSlider(property: property,
								value: band.gain - 1,
								range: -1 ... 1,
								format: "%0.1f") { band.gain = 1 + $0 }
		}

		super.init(viewModel: viewModel)

		self.stack.addArrangedSubviews(self.bandSliders)
	}

}
