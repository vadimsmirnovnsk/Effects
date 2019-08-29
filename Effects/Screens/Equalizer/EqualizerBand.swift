struct EqualizerBand {
	let from: Double
	let center: Double
	let to: Double

	var bandwidth: Double { return self.to - self.from }

	init(from: Double, center: Double, to: Double) {
		assert(to > from, "to frequency should be higher then from frequency")

		self.from = from
		self.center = center
		self.to = to
	}

	static let thirdOctaveEqualizer: [EqualizerBand] = [
		.band25, .band31, .band40,
		.band50, .band63, .band80,
		.band100, .band125, .band160,
		.band200, .band250, .band315,
		.band400, .band500, .band630,
		.band800, .band1_000, .band1_250,
		.band1_600, .band2_000, .band2_500,
		.band3_150, .band4_000, .band5_000,
		.band6_300, .band8_000, .band10_000,
		.band12_500, .band16_000, .band20_000,
	]

	static let octaveEqualizer: [EqualizerBand] = [
		.octaveBand31, .octaveBand63, .octaveBand125, .octaveBand250,
		.octaveBand500, .octaveBand1_000, .octaveBand2_000, .octaveBand4_000,
		.octaveBand8_000, .octaveBand16_000
	]

	// 1/3 Octave Equalizer

	static let band25 = EqualizerBand(from: 22.4, center: 25, to: 28.2)
	static let band31 = EqualizerBand(from: 28.2, center: 31.5, to: 35.5)
	static let band40 = EqualizerBand(from: 35.5, center: 40, to: 44.7)

	static let band50 = EqualizerBand(from: 44.7, center: 50, to: 56.2)
	static let band63 = EqualizerBand(from: 56.2, center: 63, to: 70.8)
	static let band80 = EqualizerBand(from: 70.8, center: 80, to: 89.1)

	static let band100 = EqualizerBand(from: 89.1, center: 100, to: 112)
	static let band125 = EqualizerBand(from: 112, center: 125, to: 141)
	static let band160 = EqualizerBand(from: 141, center: 160, to: 178)

	static let band200 = EqualizerBand(from: 178, center: 200, to: 224)
	static let band250 = EqualizerBand(from: 224, center: 250, to: 282)
	static let band315 = EqualizerBand(from: 282, center: 315 , to: 355)

	static let band400 = EqualizerBand(from: 355, center: 400, to: 447)
	static let band500 = EqualizerBand(from: 447, center: 500, to: 562)
	static let band630 = EqualizerBand(from: 562, center: 630 , to: 708)

	static let band800 = EqualizerBand(from: 708, center: 800, to: 891)
	static let band1_000 = EqualizerBand(from: 891, center: 1_000, to: 1_122)
	static let band1_250 = EqualizerBand(from: 1_122, center: 1_250 , to: 1_413)

	static let band1_600 = EqualizerBand(from: 1_413, center: 1_600, to: 1_778)
	static let band2_000 = EqualizerBand(from: 1_778, center: 2_000, to: 2_239)
	static let band2_500 = EqualizerBand(from: 2_239, center: 2_500 , to: 2_818)

	static let band3_150 = EqualizerBand(from: 2_818, center: 3_150, to: 3_548)
	static let band4_000 = EqualizerBand(from: 3_548, center: 4_000, to: 4_467)
	static let band5_000 = EqualizerBand(from: 4_467, center: 5_000 , to: 5_623)

	static let band6_300 = EqualizerBand(from: 5_623, center: 6_300, to: 7_079)
	static let band8_000 = EqualizerBand(from: 7_079, center: 8_000, to: 8_913)
	static let band10_000 = EqualizerBand(from: 8_913, center: 10_000 , to: 11_220)

	static let band12_500 = EqualizerBand(from: 11_220, center: 12_500, to: 14_130)
	static let band16_000 = EqualizerBand(from: 14_130, center: 16_000, to: 17_780)
	static let band20_000 = EqualizerBand(from: 17_780, center: 20_000 , to: 22_390)

	// Octave Equalizer

	static let octaveBand31 = EqualizerBand(from: 22, center: 31.5, to: 44)
	static let octaveBand63 = EqualizerBand(from: 44, center: 63, to: 88)
	static let octaveBand125 = EqualizerBand(from: 88, center: 125, to: 177)
	static let octaveBand250 = EqualizerBand(from: 177, center: 250, to: 355)
	static let octaveBand500 = EqualizerBand(from: 355, center: 500, to: 710)
	static let octaveBand1_000 = EqualizerBand(from: 710, center: 1_000, to: 1_420)
	static let octaveBand2_000 = EqualizerBand(from: 1_420, center: 2_000, to: 2_840)
	static let octaveBand4_000 = EqualizerBand(from: 2_840, center: 4_000, to: 5_680)
	static let octaveBand8_000 = EqualizerBand(from: 5_680, center: 8_000, to: 11_360)
	static let octaveBand16_000 = EqualizerBand(from: 11_360, center: 16_000, to: 22_720)
}
