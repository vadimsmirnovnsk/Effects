final class ReverbView: BaseNodeView<ReverbVM> {

	private let dryWetMix: AKSlider
	private let presets: AKPresetLoaderView


	required init(viewModel: ReverbVM) {
		self.dryWetMix = EffectSlider(property: "Mix",
									  value: viewModel.reverb.dryWetMix
		) { viewModel.reverb.dryWetMix = $0 }

		let presets = ["Cathedral", "Large Hall", "Large Hall 2",
					   "Large Room", "Large Room 2", "Medium Chamber",
					   "Medium Hall", "Medium Hall 2", "Medium Hall 3",
					   "Medium Room", "Plate", "Small Room"]

		self.presets = AKPresetLoaderView(presets: presets) { preset in
			switch preset {
			case "Cathedral":
				viewModel.reverb.loadFactoryPreset(.cathedral)
			case "Large Hall":
				viewModel.reverb.loadFactoryPreset(.largeHall)
			case "Large Hall 2":
				viewModel.reverb.loadFactoryPreset(.largeHall2)
			case "Large Room":
				viewModel.reverb.loadFactoryPreset(.largeRoom)
			case "Large Room 2":
				viewModel.reverb.loadFactoryPreset(.largeRoom2)
			case "Medium Chamber":
				viewModel.reverb.loadFactoryPreset(.mediumChamber)
			case "Medium Hall":
				viewModel.reverb.loadFactoryPreset(.mediumHall)
			case "Medium Hall 2":
				viewModel.reverb.loadFactoryPreset(.mediumHall2)
			case "Medium Hall 3":
				viewModel.reverb.loadFactoryPreset(.mediumHall3)
			case "Medium Room":
				viewModel.reverb.loadFactoryPreset(.mediumRoom)
			case "Plate":
				viewModel.reverb.loadFactoryPreset(.plate)
			case "Small Room":
				viewModel.reverb.loadFactoryPreset(.smallRoom)
			default:
				break
			}
		}

		super.init(viewModel: viewModel)

		self.presets.snp.makeConstraints { make in
			make.height.equalTo(48)
		}

		self.stack.addArrangedSubviews([
			self.dryWetMix,
			self.presets
		])
	}

}

