//
//  WalertOptionContent.swift
//  AlertController
//
//  Created by Анастасия on 25.06.2024.
//

import Foundation
import UIKit

final class WAlertOptionContent: UIView {
    
    public init (info: WAlertContentItemType) {
        self.info = info
        super.init(frame: .zero)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let info: WAlertContentItemType
}

extension WAlertOptionContent {

    
    
}
