final class EqualizerVM: BaseNodeVM {

	let bands: [AKEqualizerFilter]
	private let bandModels: [EqualizerBand]

	init(input: AKNode, equalizer: [EqualizerBand]) {
		self.bandModels = equalizer

		var bands: [AKEqualizerFilter] = []
		for (index, bandModel) in equalizer.enumerated() {
			let bandInput = index == 0 ? input : bands.last
			let band = AKEqualizerFilter(bandInput, centerFrequency: bandModel.center,
										 bandwidth: bandModel.bandwidth, gain: 1)
			bands.append(band)
		}

		self.bands = bands

		let title = String(format: "%d-band Equalizer", bands.count)
		super.init(title: title, input: input, output: bands.last ?? AKNode())
	}

}

