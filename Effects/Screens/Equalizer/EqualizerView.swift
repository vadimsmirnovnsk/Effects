final class EqualizerView: BaseNodeView<EqualizerVM> {

	private let bandSliders: [AKSlider]

	required init(viewModel: EqualizerVM) {
		self.bandSliders = viewModel.bands.map { band in
			let format = band.centerFrequency >= 1000 ? "%0.1f kHz" : "%0.f Hz"
			let value = band.centerFrequency >= 1000 ? band.centerFrequency / 1000 : band.centerFrequency
			let property = String(format: format, value)
			return EffectSlider(property: property,
								value: band.gain,
								range: -40 ... 40,
								format: "%0.1f dB") { band.gain = $0 }
		}

		super.init(viewModel: viewModel)

		self.stack.addArrangedSubviews(self.bandSliders)
	}

}
