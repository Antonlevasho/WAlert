import UIKit

final class WAlert: UIView {

    var title: String?

    //MARK: - Init
    init(info: WAlertInfo) {
        super.init(frame: .zero)
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
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  .zero),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: .zero),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  .zero),
        ])

        let info1 = WAlertOptionButtonInfo(title: "Dummy title", cornersToRound: [.bottomLeft, .bottomRight])
        let button1 = WAlertOptionButton(info: info1)

        let info2 = WAlertOptionButtonInfo(title: "Dummy title", cornersToRound: [.bottomLeft])
        let button2 = WAlertOptionButton(info: info2)

        stackView.backgroundColor = .yellow
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
