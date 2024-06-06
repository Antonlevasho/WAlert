import UIKit
    
//MARK: - WViewController
class WViewController: UIViewController {
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }

    // MARK: - Private properties
    private lazy var alertButton: UIButton = {
        let view = UIButton(type: .system)
        view.setTitle("Show alert", for: .normal)
        view.addTarget(self, action: #selector(didTapAlertButton), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
}

// MARK: - Private methods
private extension WViewController {
    func initialize() {
        view.backgroundColor = .white
        view.addSubview(alertButton)
        NSLayoutConstraint.activate([
            alertButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: .zero),
            alertButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: .zero),
        ])
    }

    @objc func didTapAlertButton() {
        let alertController = WAlert(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        alertController.showAlert(onView: self.view)
    }
}
