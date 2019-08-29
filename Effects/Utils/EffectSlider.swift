final class EffectSlider: AKSlider {

	override init(property: String, value: Double = 0.0, range: ClosedRange<Double> = 0 ... 1, taper: Double = 1, format: String = "%0.3f", color: AKColor = AKStylist.sharedInstance.nextColor, frame: CGRect = CGRect(x: 0, y: 0, width: 440, height: 60), callback: @escaping (Double) -> Void = { _ in }) {
		super.init(property: property, value: value, range: range, taper: taper, format: format, color: color, frame: frame, callback: callback)

		self.snp.makeConstraints { make in
			make.height.equalTo(44)
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
