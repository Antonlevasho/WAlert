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
            label.text = "hello"
            label.textColor = .white
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    
}

extension WAlertOptionContent {
    
    func initialize() {
        self.addSubview(titleLabels)
        titleLabels.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabels.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabels.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        titleLabels.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabels.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true 
        
    }
    
    
}
