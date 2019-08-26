final class TitledLabel: UIView {

	let title = UILabel()
	let value = UILabel()

	init(title: String) {
		super.init(frame: .zero)

		self.title.apply(.Regular14Silver, text: title)
		self.addSubview(self.title) { make in
			make.left.centerY.equalToSuperview()
		}

		self.addSubview(self.value) { make in
			make.right.centerY.equalToSuperview()
		}

		self.snp.makeConstraints { make in
			make.height.equalTo(24)
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

