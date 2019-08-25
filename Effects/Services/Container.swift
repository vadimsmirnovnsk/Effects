final class Container {

	func rootVC() -> UIViewController {
		let vc = RootVC(viewModel: RootVM())
		return vc
	}

}
