import UIKit

struct WAlertInfo {
    let content: WAlertContent
    let buttonsInfo: WButtonsInfo
}

struct WButtonsInfo {
    let buttonsAlighment: WButtonsAlighment
    let buttons: [WAlertOptionButtonInfo]
}

enum WButtonsAlighment {
    case vertical
    case horizontal
}

struct WAlertContent {
    
}
