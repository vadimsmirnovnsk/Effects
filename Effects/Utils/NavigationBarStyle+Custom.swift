import VNBase

extension NavigationBarStyle {

	private static let font: UIFont = UIFont.rubik(of: 14)

	private static let lightTitleTextAttributes: [NSAttributedString.Key : Any] = [
		.foregroundColor : UIColor.white,
		.font : NavigationBarStyle.font,
	]
	private static let lightTansparentTitleTextAttributes: [NSAttributedString.Key : Any] = [
		.foregroundColor : UIColor.white.withAlphaComponent(0.5),
		.font : UIFont.rubik(of: 18),
	]

	private static let workoutCollectionsTextAttributes: [NSAttributedString.Key : Any] = [
		.foregroundColor : UIColor.backgroundGray,
		.font : UIFont.rubikMedium(of: 24),
	]

	private static let programPlanTextAttributes: [NSAttributedString.Key : Any] = [
		.foregroundColor : UIColor.Silver.withAlphaComponent(0.5),
		.font : UIFont.rubik(of: 14),
	]

	@objc public static let semilightTansparent = NavigationBarStyle(
		tintColor: UIColor.white.withAlphaComponent(0.5),
		barTintColor: .white,
		translucent: true,
		titleTextAttributes: NavigationBarStyle.lightTansparentTitleTextAttributes,
		backgroundImage: UIImage()
	)

	@objc public static let lightTransparent = NavigationBarStyle(
		tintColor: .white,
		barTintColor: .white,
		translucent: true,
		titleTextAttributes: NavigationBarStyle.lightTitleTextAttributes,
		backgroundImage: UIImage()
	)

	@objc public static let workoutCollectionsStyle = NavigationBarStyle(
		tintColor: .backgroundGray,
		barTintColor: .white,
		translucent: false,
		titleTextAttributes: NavigationBarStyle.workoutCollectionsTextAttributes,
		backgroundImage: UIImage()
	)

	@objc public static let programPlan = NavigationBarStyle(
		tintColor: .white,
		barTintColor: .Dark,
		translucent: false,
		titleTextAttributes: NavigationBarStyle.programPlanTextAttributes,
		backgroundImage: UIImage()
	)

}
