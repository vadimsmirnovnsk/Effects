import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?
	var container: Container!

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		self.container = Container()

		self.setupAppearance()
		self.window = UIWindow()
		self.window?.backgroundColor = .white
		self.window?.rootViewController = self.container.rootVC()
		self.window?.makeKeyAndVisible()

		return true
	}

	func setupAppearance() {
	}

}

