struct TextStyle {
	let font: UIFont
	let interLetterSpacing: CGFloat
	var color: UIColor
	var lineHeight: CGFloat = 0
}

extension TextStyle {

	public func with(_ populator: (inout TextStyle) throws -> ()) rethrows -> TextStyle {
		var style = self
		try populator(&style)
		return style
	}

	static let Medium10White = TextStyle(font: .rubikMedium(of: 10), interLetterSpacing: 0.05, color: UIColor.white, lineHeight: 11.85)

	static let Medium14White = TextStyle(font: .rubikMedium(of: 14), interLetterSpacing: 0.15, color: UIColor.white, lineHeight: 16.5)
	static let Medium14Orange = Medium14White.with { $0.color = .backgroundOrange }
	static let MediumItalicGreen14 = TextStyle(font: .rubikMediumItalic(of: 14), interLetterSpacing: 0.15, color: .skillGreen, lineHeight: 16.5)
	static let Medium14HighlightedOrange = Medium14Orange.with { $0.color = UIColor.backgroundOrange.withAlphaComponent(0.3) }

	static let MediumCondenced14White = TextStyle(font: .rubikMedium(of: 14), interLetterSpacing: 0, color: .white, lineHeight: 17)

	static let RegularGreen11 = TextStyle(font: .rubik(of: 11), interLetterSpacing: 0, color: .Green, lineHeight: 13)
	static let Regular11Silver = RegularGreen11.with { $0.color = .Silver }
	static let RegularOrange11 = RegularGreen11.with { $0.color = .backgroundOrange }
	static let Regular18Green = TextStyle(font: .rubik(of: 18), interLetterSpacing: 0, color: .Green, lineHeight: 21)
	static let Regular18White = Regular18Green.with { $0.color = .white }
	static let Regular18SemiWhite = Regular18Green.with { $0.color = UIColor.white.withAlphaComponent(0.5) }
	static let RegularAdaptedBlue18 = Regular18Green.with { $0.color = .adaptedBlue }
	static let Regular18Orange = Regular18Green.with { $0.color = .backgroundOrange }
	static let Regular18Silver = Regular18Green.with { $0.color = .Silver }
	static let Bold18White = TextStyle(font: .rubikBold(of: 18), interLetterSpacing: 0, color: .white, lineHeight: 21)

	static let Regular14White = TextStyle(font: .rubik(of: 14), interLetterSpacing: 0, color: UIColor.white, lineHeight: 17)
	static let Regular14SemiWhite = Regular14White.with { $0.color = UIColor.white.withAlphaComponent(0.5) }
	static let Regular14Silver = Regular14White.with { $0.color = .Silver }
	static let Regular14HighlightedSilver = Regular14Silver.with { $0.color = UIColor.Silver.withAlphaComponent(0.3) }
	static let Regular14SuperTranparentSilver = Regular14White.with { $0.color = UIColor.Silver.withAlphaComponent(0.1) }
	static let Regular14Green = Regular14Silver.with { $0.color = .Green }
	static let Regular14Orange = Regular14Silver.with { $0.color = .backgroundOrange }
	static let Regular14Dark = Regular14Silver.with { $0.color = .Dark }

	static let Regular24Dark = TextStyle(font: .rubik(of: 24), interLetterSpacing: 0, color: .Dark, lineHeight: 24)
	static let Regular24White = Regular24Dark.with { $0.color = .white }

	static let MediumWhite18 = TextStyle(font: .rubikMedium(of: 18), interLetterSpacing: -0.05, color: UIColor.white, lineHeight: 21.33)
	static let BoldWhite18 = TextStyle(font: .rubikBold(of: 18), interLetterSpacing: 0, color: UIColor.white, lineHeight: 21.33)
	static let Medium24Orange = TextStyle(font: .rubikMedium(of: 24), interLetterSpacing: -0.05, color: UIColor.backgroundOrange, lineHeight: 24)
	static let MediumWhite36 = TextStyle(font: .rubikMedium(of: 36), interLetterSpacing: -0.05, color: UIColor.white, lineHeight: 34)
	static let MediumGreen36 = MediumWhite36.with { $0.color = .Green }
	static let Medium8pxWhite = TextStyle(font: .rubik(of: 8), interLetterSpacing: 0, color: UIColor.white, lineHeight: 9)

	func attributedString(
		_ text: String,
		textAlignment: NSTextAlignment = .left,
		lineHeightMultiple: CGFloat? = nil
	) -> NSMutableAttributedString {
		let attributes = self.attributes(textAlignment: textAlignment, lineHeightMultiple: lineHeightMultiple)
		let attributedText = NSMutableAttributedString(string: text, attributes: attributes)
		return attributedText
	}

	func attributes(textAlignment: NSTextAlignment = .left, lineHeightMultiple: CGFloat? = nil) -> [NSAttributedString.Key : Any] {
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.minimumLineHeight = self.lineHeight
		paragraphStyle.maximumLineHeight = self.lineHeight
		paragraphStyle.alignment = textAlignment
		paragraphStyle.lineBreakMode = .byTruncatingTail
		if let lineHeightMultiple = lineHeightMultiple {
			paragraphStyle.lineHeightMultiple = lineHeightMultiple
		}
		let attributes: [NSAttributedString.Key : Any] = [
			.font : self.font,
			.paragraphStyle : paragraphStyle,
			.kern: NSNumber(value: Float(self.font.pointSize * self.interLetterSpacing)),
			.foregroundColor: self.color,
		]
		return attributes
	}

}

extension UIButton {
	func apply(_ style: TextStyle, text: String, state: UIControl.State = .normal) {
		let text = style.attributedString(text, textAlignment: .center)
		self.setAttributedTitle(text, for: state)
	}
}

extension UILabel {
	func apply(_ style: TextStyle, text: String, textAlignment: NSTextAlignment = .left) {
		self.attributedText = style.attributedString(text, textAlignment: textAlignment)
	}
}

extension UIBarItem {
	func apply(_ style: TextStyle, state: UIControl.State) {
		let attributes = style.attributes(textAlignment: .center)
		self.setTitleTextAttributes(attributes, for: state)
	}
}

extension UILabel {

	static func label(
		text: String? = nil,
		textAlignment: NSTextAlignment = .left,
		textColor: UIColor = .black,
		font: UIFont = .rubik(of: 18),
		lineSpacing: CGFloat? = nil
	) -> Self {
		let label = self.init()
		if let lineSpacing = lineSpacing, let text = text {
			let paragraphStyle = NSMutableParagraphStyle()
			paragraphStyle.lineSpacing = lineSpacing
			label.attributedText = NSAttributedString(string: text, attributes: [
				NSAttributedString.Key.paragraphStyle : paragraphStyle
			])
		} else {
			label.text = text
		}
		label.textAlignment = textAlignment
		label.textColor = textColor
		label.font = font
		return label
	}

}

extension NSMutableAttributedString {

	@discardableResult func imagified(with image: UIImage?, bounds: CGRect) -> NSAttributedString {
		guard let image = image else { return self }
		let image1Attachment = NSTextAttachment()
		image1Attachment.image = image
		image1Attachment.bounds = bounds
		let imageString = NSAttributedString(attachment: image1Attachment)
		self.append(imageString)
		return self
	}

	@discardableResult func with(attributes: [NSAttributedString.Key : Any],
			  for attributingText: String,
			  in text: String) -> NSMutableAttributedString
	{
		self.setAttributes(attributes,
			range: (text as NSString).range(of: attributingText)
		)

		return self
	}

}
