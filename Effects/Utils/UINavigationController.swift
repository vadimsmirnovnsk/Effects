extension UINavigationController {

	open override var preferredStatusBarStyle: UIStatusBarStyle {
		if let topViewController = presentedViewController {
			return topViewController.preferredStatusBarStyle
		}
		if let topViewController = viewControllers.last {
			return topViewController.preferredStatusBarStyle
		}

		return .default
	}

}
