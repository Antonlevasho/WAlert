import UIKit

protocol WAlertOptionButtonDelegate: AnyObject {
    func didTap(from view: WAlertOptionButton)
}

final class WAlertOptionButton: UIView {
    // MARK: - Public
    weak var delegate: WAlertOptionButtonDelegate?

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

    // MARK: - View lifecycle
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = true
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = true
        handleTouch(touches, touchEnded: false)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
        handleTouch(touches, touchEnded: true)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        isHighlighted = false
    }

    // MARK: - Private properties
    private let info: WAlertOptionButtonInfo

    private var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.5,
                            delay: .zero,
                            options: [.curveEaseOut, .allowUserInteraction],
                           animations: {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.95, y: 0.95) : .identity
            }, completion: nil)
        }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = info.title
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

// MARK: - Private methods
private extension WAlertOptionButton {
    func initialize() {
        backgroundColor = .red
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: .zero),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant:  .zero),
        ])
        
        
        
        
    }

    func handleTouch(_ touches: Set<UITouch>, touchEnded: Bool) {
        if let touchLocationInSuperview: CGPoint = touches.first?.location(in: self.superview) {
            let touchLocation: CGPoint = self.convert(touchLocationInSuperview, to: self)
            if frame.contains(touchLocation) {
                if touchEnded {
                    animateToDefaultState()
                    delegate?.didTap(from: self)
                } else {
                    animateToActiveState()
                }
            } else {
                animateToDefaultState()
            }
        } else {
            animateToDefaultState()
        }
    }

    func animateToActiveState() {
        isHighlighted = true
    }

    func animateToDefaultState() {
        isHighlighted = false
    }
}
