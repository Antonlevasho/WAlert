import UIKit

protocol WAlertOptionButtonDelegate: AnyObject {
    func didTap(from view: WAlertOptionButton)
}

final class WAlertOptionButton: UIView {
    // MARK: - Init
    public init(info: WAlertOptionButtonInfo) {
        self.info = info
        self.isHighlighted = false
        super.init(frame: .zero)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private properties
    private let info: WAlertOptionButtonInfo

    private var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.5,
                            delay: .zero,
                            options: [.curveEaseOut, .allowUserInteraction],
                           animations: {
                // тут положить дополнительные анимации при нажатии, например поменять цвет
            }, completion: nil)
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.backgroundColor = .black
        return label
    }()
}

// MARK: - Private methods
private extension WAlertOptionButton {
    func initialize() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = .cyan
        
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 80).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: 150).isActive = true
        
        titleLabel.widthAnchor.constraint(equalToConstant: 120).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true 
    }
}
