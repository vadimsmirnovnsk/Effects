final class MicVM: BaseVM {

	let mic = AKMicrophone()
	let tracker: AKFrequencyTracker
	let micOutput: AKBooster

	var updateBlock: VoidBlock? = nil

	let noteFrequencies = [16.35, 17.32, 18.35, 19.45, 20.6, 21.83, 23.12, 24.5, 25.96, 27.5, 29.14, 30.87]
	let noteNamesWithSharps = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
	let noteNamesWithFlats = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]

	override init() {
		self.tracker = AKFrequencyTracker(self.mic)
		self.micOutput = AKBooster(self.tracker, gain: 1)

		super.init()
	}

	func launch() {
		Timer.scheduledTimer(timeInterval: 0.1,
							 target: self,
							 selector: #selector(updateUI),
							 userInfo: nil,
							 repeats: true)
	}

	@objc private func updateUI() {
		DispatchQueue.main.async {
			self.updateBlock?()
		}
	}

}
