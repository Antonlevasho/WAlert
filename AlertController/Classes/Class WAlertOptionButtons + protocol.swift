//
//  Class + protocol.swift
//  AlertController
//
//  Created by Анастасия on 21.05.2024.
//

import Foundation
import UIKit

//protocol WAlertOptionButtonDelegate: AnyObject {
//    func didTap(from: UIView)
//}


class WAlertOptionButton: UIView {

    var title: String
    
    var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.5,
                            delay: .zero,
                            options: [.curveEaseOut, .allowUserInteraction],
                           animations: {
                // тут положить дополнительные анимации при нажатии, например поменять цвет
            }, completion: nil)
        }
    }
    
    public init(title: String ) {
        self.title = title
        self.isHighlighted = false
        
        super.init(frame: .zero)
        initialize()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Hello"
        label.backgroundColor = .black
        
        
        return label
    }()
}

extension WAlertOptionButton {
    func initialize() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = .black
        
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true 
    }
}

    
//    weak var delegates: WAlertOptionButtonDelegate?

    //MARK: - show bottons
    
//    func showButton(view: UIView) {
//        self.center = view.center
//        view.addSubview(self)
//        
//        
//    }


//    var isHighlighted: Bool {
//        didSet {
//            UIView.animate(withDuration: 0.5,
//                            delay: .zero,
//                            options: [.curveEaseOut, .allowUserInteraction],
//                           animations: {
//                // тут положить дополнительные анимации при нажатии, например поменять цвет
//            }, completion: nil)
//        }
//    }
//}

//extension WAlertOptionButtons {
//
////    weak var delegates: WAlertOptionButtonDelegate?
//
//    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        animateToActiveState()
//    }
//
//    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        handleTouch(touches, touchEnded: false)
//    }
//
//    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        handleTouch(touches, touchEnded: true)
//    }
//
//    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        animateToDefaultState()
//    }
//
//    func handleTouch(_ touches: Set<UITouch>, touchEnded: Bool) {
//        if let touchLocationInSuperview: CGPoint = touches.first?.location(in: self.superview) {
//            let touchLocation: CGPoint = self.convert(touchLocationInSuperview, to: self)
//            if frame.contains(touchLocation) {
//                if touchEnded {
//                    animateToDefaultState()
//                    delegates?.didTap(from: self)
//                } else {
//                    animateToActiveState()
//                }
//            } else {
//                animateToDefaultState()
//            }
//        } else {
//            animateToDefaultState()
//        }
//    }
//
//    func animateToActiveState() {
//        isHighlighted = true
//    }
//
//    func animateToDefaultState() {
//        isHighlighted = false
//    }
//
//
//}
