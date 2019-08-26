class BaseNodeVM: BaseVM {

	let title: String
	var updateBlock: VoidBlock? = nil
	let output: AKNode
	let input: AKNode?

	init(title: String, input: AKNode?, output: AKNode) {
		self.title = title
		self.output = output
		self.input = input

		super.init()
	}

	@objc func updateUI() {
		DispatchQueue.main.async {
			self.updateBlock?()
		}
	}

}
