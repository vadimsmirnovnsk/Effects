internal extension UIFont { // + CustomFonts

	static func rubik(of size: CGFloat) -> UIFont {
		let font = UIFont.systemFont(ofSize: size)
		return font
	}
	static func rubikMedium(of size: CGFloat) -> UIFont {
		let font = UIFont.systemFont(ofSize: size)
		return font
	}
	static func rubikMediumItalic(of size: CGFloat) -> UIFont {
		let font = UIFont.italicSystemFont(ofSize: size)
		return font
	}
	static func rubikBold(of size: CGFloat) -> UIFont {
		let font = UIFont.boldSystemFont(ofSize: size)
		return font
	}

	static func listOfFonts() {
		var output = ""
		for familyName in UIFont.familyNames {
			let title = "Family name: \(familyName)"
			let content = "Fonts: \(UIFont.fontNames(forFamilyName: familyName))"
			output = output + "\n" + title + "\n" + content + "\n"
		}
		print(">>> \(output)")
	}

}
