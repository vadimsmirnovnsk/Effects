class BaseNodeVM: BaseVM {

	let title: String
	var updateBlock: VoidBlock? = nil
	let output: AKNode
	let input: AKNode?
	var nodes: [AKToggleable] = []

	var isEnabled: Bool = true {
		didSet {
			guard oldValue != self.isEnabled else { return }
			self.viewModelChanged()
			self.didToggle(enabled: self.isEnabled)
		}
	}

	var isExpanded: Bool = true {
		didSet {
			guard oldValue != self.isExpanded else { return }
			self.viewModelChanged()
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
