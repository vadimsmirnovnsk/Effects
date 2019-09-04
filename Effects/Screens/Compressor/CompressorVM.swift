final class CompressorVM: BaseNodeVM {

	let compressor: AKCompressor

	init(input: AKNode?) {
		self.compressor = AKCompressor(input)

		super.init(title: "Compressor", input: input, output: self.compressor)
	}

}
