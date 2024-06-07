import UIKit

final class WAlert: UIView {
    //MARK: - Init
    init(info: WAlertInfo) {
        self.info = info
        super.init(frame: .zero)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private properties
    private let info: WAlertInfo
}

// MARK: - Private methods
private extension WAlert {
    func initialize() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .lightGray
        layer.cornerRadius = 20

        let stackView = UIStackView()
        switch info.buttonsInfo.buttonsAlighment {
        case .vertical:
            stackView.axis = .vertical
        case .horizontal:
            stackView.axis = .horizontal
        }
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  .zero),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  .zero),
        ])

        info.buttonsInfo.buttons.forEach {
            let info = WAlertOptionButtonInfo(title: $0.title, cornersToRound: $0.cornersToRound)
            let button = WAlertOptionButton(info: info)
            stackView.addArrangedSubview(button)
        }
    }
}
