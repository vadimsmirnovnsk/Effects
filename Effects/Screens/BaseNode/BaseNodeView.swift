class BaseNodeView<T: BaseNodeVM> : BaseView<T> {

	let stack = UIStackView.stack()
	let title = UILabel()

	required init(viewModel: T) {
		super.init()

		self.viewModel = viewModel
		self.viewModel?.updateBlock = { [weak self] in self?.updateUI() }

		self.title.apply(.Regular24White, text: viewModel.title)

		self.addSubview(self.title) { make in
			make.top.equalToSuperview().offset(12)
			make.left.right.equalToSuperview()
		}

		let separator = UIView.pixelSeparator()
		self.addSubview(separator) { make in
			make.left.bottom.right.equalToSuperview()
		}

		self.addSubview(self.stack) { make in
			make.top.equalTo(self.title.snp.bottom).offset(8)
			make.left.right.equalToSuperview()
			make.bottom.equalTo(separator.snp.top).offset(-20)
		}
	}

	open func updateUI() {
	}

}

