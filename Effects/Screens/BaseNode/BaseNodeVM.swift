class BaseNodeVM: BaseVM {

	let title: String
	var updateBlock: VoidBlock? = nil
	let output: AKNode
	let input: AKNode?
	var nodes: [AKToggleable] = []

	var isEnabled: Bool = true {
		didSet {
			self.didToggle(enabled: self.isEnabled)
		}
	}

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

	func didToggle(enabled: Bool) {
		if enabled {
			self.nodes.forEach { $0.start() }
		} else {
			self.nodes.forEach { $0.stop() }
		}
	}

}
