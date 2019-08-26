extension UIView {

	static func colored(with color: UIColor) -> UIView {
		let v = UIView()
		v.backgroundColor = color
		return v
	}

	static func space(_ space: CGFloat) -> UIView {
		let v = UIView()
		v.snp.makeConstraints { $0.height.equalTo(space) }
		return v
	}

	static func pixelSeparator() -> UIView {
		let v = UIView()
		v.snp.makeConstraints { $0.height.equalTo(1 / UIScreen.main.scale) }
		v.backgroundColor = .Silver
		return v
	}

}
