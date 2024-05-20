//
//  Info.swift
//  AlertController
//
//  Created by Анастасия on 20.05.2024.
//

import Foundation
import UIKit

struct WAlertinfo {
    
let content: WAlertContent
let buttonsInfo: WButtonsInfo
    
}

struct WButtonsInfo {
    
var buttonsAlighment: WButtonsAlighment
    
}

enum WButtonsAlighment {
    case vertical
    case horizontal
}

struct WAlertContent {
    
}

struct WButtonInfo {
    let title: String
    let cornersToRound: [WalertOptionbuttonCorner]
}

enum WalertOptionbuttonCorner {
    case bottomLeft
    case bottomRight
    
}
