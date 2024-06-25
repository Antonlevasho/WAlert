//
//  WalertOptionContent.swift
//  AlertController
//
//  Created by Анастасия on 25.06.2024.
//

import Foundation
import UIKit

final class WAlertOptionContent: UIView {
    
    public init (info: WalertContentItemType) {
        self.info = info
        super.init(frame: .zero)
        initialize()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let info: WalertContentItemType
        
        private lazy var titleLabels: UILabel = {
            let label = UILabel()
            label.text = "Hello"
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    
}

extension WAlertOptionContent {
    
    func initialize() {
        self.addSubview(titleLabels)
        titleLabels.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabels.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 100).isActive = true
        titleLabels.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100).isActive = true
        
    }
    
    
}
