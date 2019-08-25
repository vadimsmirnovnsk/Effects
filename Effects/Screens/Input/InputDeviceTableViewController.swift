import UIKit
import AudioKit

protocol DeviceDelegate: AnyObject {
    func didSelectInputDevice(_ device: AKDevice)
	func didSelectOutputDevice(_ device: AKDevice)
}

class DeviceTableViewController: UITableViewController {

	enum Style {
		case input
		case output

		var title: String {
			switch self {
				case .input: return "Available Inputs"
				case .output: return "Available Outputs"
			}
		}

		var devices: [AKDevice] {
			switch self {
				case .input: return AudioKit.inputDevices ?? []
				case .output: return AudioKit.outputDevices ?? []
			}
		}

		var currentDevice: AKDevice? {
			switch self {
				case .input: return AudioKit.inputDevice
				case .output: return AudioKit.outputDevice
			}
		}
	}

	private let style: DeviceTableViewController.Style
    private let reuseIdentifier = "inputCell"
    weak var settingsDelegate: DeviceDelegate?

	init(style: DeviceTableViewController.Style) {
		self.style = style

		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

    override func viewDidLoad() {
        super.viewDidLoad()

		self.title = self.style.title
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.style.devices.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        let device = self.style.devices[indexPath.row]
        cell.textLabel?.text = device.name
        cell.detailTextLabel?.text = device.deviceID
        cell.accessoryType = (device == self.style.currentDevice) ? .checkmark : .none
        return cell
    }

    // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
		switch self.style {
			case .input: self.settingsDelegate?.didSelectInputDevice(self.style.devices[indexPath.row])
			case .output: self.settingsDelegate?.didSelectOutputDevice(self.style.devices[indexPath.row])
		}
		
        self.dismiss(animated: true, completion: nil)
    }

}
