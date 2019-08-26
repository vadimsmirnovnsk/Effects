final class OutputView: BaseNodeView<OutputVM> {

	private let volume: AKSlider

	required init(viewModel: OutputVM) {
		self.volume = AKSlider(property: "Master", value: 1) { value in
			viewModel.booster.gain = value
		}
		self.volume.color = .RadicalRed

		super.init(viewModel: viewModel)

		self.stack.addArrangedSubview(self.volume)

		self.volume.snp.makeConstraints { make in
			make.height.equalTo(44)
		}
	}

}
