import VNBase
import AudioKitUI

final class MicView: BaseView<MicVM> {

	private let stack = UIStackView.stack()
	private let title = UILabel()
	private let frequencyLabel = TitledLabel(title: "Frequency")
	private let amplitudeLabel = TitledLabel(title: "Amplitude")
	private let noteNameWithSharpsLabel = TitledLabel(title: "Note #")
	private let noteNameWithFlatsLabel = TitledLabel(title: "Note flats")
	private let audioInputPlot: EZAudioPlot

	required init(viewModel: MicVM) {
		self.audioInputPlot = EZAudioPlot(frame: .zero)
		let plot = AKNodeOutputPlot(viewModel.mic, frame: .zero)
		plot.plotType = .rolling
		plot.shouldFill = true
		plot.shouldMirror = true
		plot.color = .backgroundBlue
		plot.gain = 5

		super.init()

		self.viewModel = viewModel
		self.viewModel?.updateBlock = { [weak self] in self?.updateUI() }

		self.addSubview(self.stack) { make in make.edges.equalToSuperview() }
		self.audioInputPlot.snp.makeConstraints { make in make.height.equalTo(100) }

		self.title.apply(.Regular24White, text: "Mic Analysis")

		self.stack.addArrangedSubviews([
			self.title,
			self.frequencyLabel,
			self.amplitudeLabel,
			self.noteNameWithSharpsLabel,
			self.noteNameWithFlatsLabel,
			self.audioInputPlot
		])

		plot.backgroundColor = .Dark
		self.audioInputPlot.addSubview(plot) { make in
			make.edges.equalToSuperview()
		}
	}

	func updateUI() {
		guard let vm = self.viewModel else { return }

		if vm.tracker.amplitude > 0.1 {
			self.frequencyLabel.value.apply(.Regular14White, text: String(format: "%0.1f", vm.tracker.frequency))

			var frequency = Float(vm.tracker.frequency)
			while (frequency > Float(vm.noteFrequencies[vm.noteFrequencies.count-1])) {
				frequency = frequency / 2.0
			}
			while (frequency < Float(vm.noteFrequencies[0])) {
				frequency = frequency * 2.0
			}

			var minDistance: Float = 10000.0
			var index = 0

			for i in 0..<vm.noteFrequencies.count {
				let distance = fabsf(Float(vm.noteFrequencies[i]) - frequency)
				if (distance < minDistance){
					index = i
					minDistance = distance
				}
			}
			let octave = Int(log2f(Float(vm.tracker.frequency) / frequency))
			self.noteNameWithSharpsLabel.value.apply(.Regular14White, text: "\(vm.noteNamesWithSharps[index])\(octave)")
			self.noteNameWithFlatsLabel.value.apply(.Regular14White, text: "\(vm.noteNamesWithFlats[index])\(octave)")
		}
		self.amplitudeLabel.value.apply(.Regular14White, text: String(format: "%0.2f", vm.tracker.amplitude))
	}

}
