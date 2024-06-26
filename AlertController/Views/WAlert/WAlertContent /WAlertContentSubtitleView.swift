//
//  WAlertContentSubtitleView.swift
//  AlertController
//
//  Created by Анастасия on 25.06.2024.
//

import Foundation
import UIKit

class WAlertContentSubtitleView: UIView {
        public init (text: String) {
            super.init(frame: .zero)
            self.subTitleLabel.text = text
            initializes()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private lazy var subTitleLabel: UILabel = {
                    let label = UILabel()
                    label.text = "hello"
                    label.textColor = .white
                    label.translatesAutoresizingMaskIntoConstraints = false
                    return label
                }()
    }

    extension WAlertContentSubtitleView {

        func initializes() {
            self.addSubview(subTitleLabel)
            subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
            subTitleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
            subTitleLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
            subTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true

            }
    }
    

