import UIKit

final class WAlert: UIView {
    //MARK: - Init
    init(info: WAlertInfo) {
        self.info = info
        super.init(frame: .zero)
        initialize()
        initializeTitleLabel()
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
        layer.cornerRadius = 10

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
        
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 195),
        ])

        info.buttonsInfo.buttons.forEach {
        
            let info = WAlertOptionButtonInfo(title: $0.title, cornersToRound: $0.cornersToRound)
            let button = WAlertOptionButton(info: info)
            
            button.clipsToBounds = true
            button.layer.cornerRadius = 10
            
            button.layer.maskedCorners = info.cornersToRound.toCACornerMask()
           
            stackView.addArrangedSubview(button)
            
                   button.heightAnchor.constraint(equalToConstant: 50).isActive = true
}
    }
}

extension WAlert {
    func initializeTitleLabel() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .black
        layer.cornerRadius = 10
        
        let stackViewContent = UIStackView()
        switch info.content {
            
        case .title:
            stackViewContent.axis = .vertical
        case .subtitle(text: let text):
            stackViewContent.axis = .vertical
        case .image(image: let image):
            stackViewContent.axis = .vertical
        }
        stackViewContent.distribution = .fillEqually
        stackViewContent.alignment = .fill
        stackViewContent.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackViewContent.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        stackViewContent.isLayoutMarginsRelativeArrangement = true
        
        addSubview(stackViewContent)
        NSLayoutConstraint.activate([
            stackViewContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackViewContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackViewContent.topAnchor.constraint(equalTo: self.topAnchor, constant: 195),
        ])
        
    }
}
