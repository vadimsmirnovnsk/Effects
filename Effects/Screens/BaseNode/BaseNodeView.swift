class BaseNodeView<T: BaseNodeVM> : BaseView<T> {

	let stack = UIStackView.stack()
	let title = UILabel()
	let switchStack = UIStackView.stack(axis: .horizontal)
	let enabledSwitch = TitledSwitch(title: "On/Off")
	let expandSwitch = TitledSwitch(title: "Expand")

	required init(viewModel: T) {
		super.init()

		self.viewModel = viewModel
		self.viewModel?.updateBlock = { [weak self] in self?.updateUI() }

		self.title.apply(.Regular24White, text: viewModel.title)

		self.addSubview(self.title) { make in
			make.top.equalToSuperview().offset(12)
			make.left.right.equalToSuperview()
		}

		self.addSubview(self.switchStack) { make in
			make.top.equalTo(self.title.snp.bottom).offset(8)
			make.left.right.equalToSuperview().inset(16)
		}

		let separator = UIView.pixelSeparator()
		self.addSubview(separator) { make in
			make.left.bottom.right.equalToSuperview()
		}

		self.addSubview(self.stack) { make in
			make.top.equalTo(self.self.switchStack.snp.bottom).offset(8)
			make.left.right.equalToSuperview()
			make.bottom.equalTo(separator.snp.top).offset(-20)
		}

		self.switchStack.addArrangedSubviews([
			self.enabledSwitch,
			self.expandSwitch
		])

		self.expandSwitch.switch.onSwitch = { [weak self] on in
			self?.updateHidden(expanded: on)
		}

		self.enabledSwitch.switch.onSwitch = { [weak self] on in
			self?.viewModel?.isEnabled = on
		}
	}

	override func viewModelChanged() {
		super.viewModelChanged()

		guard let vm = self.viewModel else { return }

		self.enabledSwitch.switch.isOn = vm.isEnabled
		self.expandSwitch.switch.isOn = vm.isExpanded
		self.updateHidden(expanded: vm.isExpanded)
	}

	open func updateUI() {
	}

	private func updateHidden(expanded: Bool) {
		UIView.animate(withDuration: 0.3, animations: {
			self.stack.arrangedSubviews.forEach { $0.alpha = expanded ? 1 : 0 }
		})
		self.stack.arrangedSubviews.forEach {
			$0.isHidden = !expanded
		}
		print(self.stack.arrangedSubviews)
	}

}

