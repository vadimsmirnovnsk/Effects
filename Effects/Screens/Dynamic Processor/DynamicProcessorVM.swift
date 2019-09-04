final class DynamicProcessorVM: BaseNodeVM {

	let processor: AKDynamicsProcessor

	init(input: AKNode?) {
		self.processor = AKDynamicsProcessor(input)

		super.init(title: "Dynamics Processor", input: input, output: self.processor)

		self.nodes = [self.processor]
	}

}
