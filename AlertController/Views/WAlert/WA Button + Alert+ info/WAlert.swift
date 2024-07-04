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
        layer.cornerRadius = 10
        
        
        //MARK: -contentStackView
        
//        let alertStackView = UIStackView()
//
//        addSubview(alertStackView)
//        alertStackView.translatesAutoresizingMaskIntoConstraints = false
//        alertStackView.axis = .vertical
//        alertStackView.distribution = .fillEqually
//        alertStackView.alignment = .fill
//        alertStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        alertStackView.isLayoutMarginsRelativeArrangement = true
//        alertStackView.backgroundColor = .brown
//
//        NSLayoutConstraint.activate([
//            alertStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            alertStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            alertStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
//            alertStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
//            ])
//
//        alertStackView.addArrangedSubview(contentStackView)
//
        
        
        
        //MARK: -contentStackView
        let contentStackView = UIStackView()
        contentStackView.axis = .vertical
        contentStackView.distribution = .fillEqually
        contentStackView.alignment = .fill
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        contentStackView.isLayoutMarginsRelativeArrangement = true
        
        addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            contentStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
        ])
        info.content.forEach({
            switch $0 {
            case .title(let textTitle):
                let title = WAlertContentTitleView(text: textTitle)
                contentStackView.addArrangedSubview(title)
            case .subtitle(let text):
                let subTitle = WAlertContentSubtitleView(text: text)
                contentStackView.addArrangedSubview(subTitle)
            case .image(let imageContentView):
                let image = WAlertImageContent(image: imageContentView)
                contentStackView.addArrangedSubview(image)
            }
            })
        //MARK: -buttonsStackView
        let buttonsStackView = UIStackView()
        switch info.buttonsInfo.buttonsAlighment {
        case .vertical:
            buttonsStackView.axis = .vertical
        case .horizontal:
            buttonsStackView.axis = .horizontal
        }
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.alignment = .fill
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        buttonsStackView.isLayoutMarginsRelativeArrangement = true
        addSubview(buttonsStackView)
        NSLayoutConstraint.activate([
            buttonsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            buttonsStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 195),
            
        ])

        info.buttonsInfo.buttons.forEach {
            let info = WAlertOptionButtonInfo(title: $0.title, cornersToRound: $0.cornersToRound)
            let button = WAlertOptionButton(info: info)
            button.clipsToBounds = true
            button.layer.cornerRadius = 10
            button.layer.maskedCorners = info.cornersToRound.toCACornerMask()
            buttonsStackView.addArrangedSubview(button)
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
}
        
        let alertStackView = UIStackView()
        
        addSubview(alertStackView)
        alertStackView.translatesAutoresizingMaskIntoConstraints = false
        alertStackView.axis = .vertical
        alertStackView.distribution = .fillEqually
        alertStackView.alignment = .fill
        alertStackView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        alertStackView.isLayoutMarginsRelativeArrangement = true
        alertStackView.backgroundColor = .brown
 
        NSLayoutConstraint.activate([
            alertStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            alertStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            alertStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            alertStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            ])
        
        alertStackView.addArrangedSubview(contentStackView)
        alertStackView.addArrangedSubview(buttonsStackView)
        
            }
    
    
    
    }


