//
//  Extension VC.swift
//  AlertController
//
//  Created by Анастасия on 16.05.2024.
//

import Foundation
import UIKit


extension WAlert {
    
    func showAlert(onView view: UIView) {
        self.center = view.center
        view.addSubview(self)
        
        // Анимация появления
        self.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
            self.transform = CGAffineTransform.identity
        }
    }
    
}


    

