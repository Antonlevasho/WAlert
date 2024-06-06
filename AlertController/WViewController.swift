import UIKit
    
//MARK: - WViewController
class WViewController: UIViewController {
    // MARK: - Public
    func showAlert(with info: WAlertInfo) {
        let alert = WAlert(info: info)
        view.addSubview(alert)

        NSLayoutConstraint.activate([
            alert.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            alert.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            alert.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            alert.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
        ])


        alert.center = view.center
        alert.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        alert.alpha = 0
        UIView.animate(withDuration: 0.25) {
            alert.alpha = 1
            alert.transform = CGAffineTransform.identity
        }
    }

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
        let buttonsInfo = WButtonsInfo(buttonsAlighment: .horizontal, buttons: [
            WAlertOptionButtonInfo(title: "Button1", cornersToRound: [.bottomLeft]),
            WAlertOptionButtonInfo(title: "Button2", cornersToRound: [.bottomRight]),
        ])
        let info = WAlertInfo(content: .init(), buttonsInfo: buttonsInfo)
        showAlert(with: info)
    }
}
