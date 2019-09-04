final class TitledSwitch: UIView {

	private let title = UILabel()
	let `switch` = BlockSwitch()

	init(title: String) {
		super.init(frame: .zero)

		self.title.apply(.Regular14White, text: title)

		self.addSubview(self.switch) { make in
			make.right.centerY.equalToSuperview()
		}

		self.title.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
		self.addSubview(self.title) { make in
			make.right.equalTo(self.switch.snp.left).offset(-16)
			make.left.centerY.equalToSuperview()
		}

		self.snp.makeConstraints { make in
			make.height.equalTo(48)
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
