final class CompressorVM: BaseNodeVM {

	let compressor: AKCompressor

	init(input: AKNode?) {
		self.compressor = AKCompressor(input)

		self.compressor.threshold = 0.8
		self.compressor.headRoom = 16.85
		self.compressor.attackDuration = 0.001
		self.compressor.releaseDuration = 3

		super.init(title: "Compressor", input: input, output: self.compressor)

		self.nodes = [self.compressor]
	}

}
