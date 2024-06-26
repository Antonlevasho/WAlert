//
//  WAlertImageContent.swift
//  AlertController
//
//  Created by Анастасия on 26.06.2024.
//

import Foundation
import UIKit

class WAlertImageContent: UIView {
        
        public init (image: UIImage) {
            super.init(frame: .zero)
            imageContentView.image = image
            initializes()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private lazy var imageContentView: UIImageView = {
                    let image = UIImageView()
            
                    return image
                }()
    }

    extension WAlertImageContent {

        func initializes() {
            self.addSubview(imageContentView)
            imageContentView.translatesAutoresizingMaskIntoConstraints = false
            imageContentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
            imageContentView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
            imageContentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            imageContentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

            }
    }
