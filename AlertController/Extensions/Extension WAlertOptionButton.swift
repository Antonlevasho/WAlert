//
//  Extension WAlertOptionButton.swift
//  AlertController
//
//  Created by Анастасия on 20.05.2024.
//

import Foundation
import UIKit 

extension WAlertOptionButton {
    
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateToActiveState()
    }

    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouch(touches, touchEnded: false)
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouch(touches, touchEnded: true)
    }

    public override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        animateToDefaultState()
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
