import UIKit

struct WAlertInfo {
    let content: WalertContentItemType
    let buttonsInfo: WButtonsInfo
}

enum WalertContentItemType {
    case title(text: String)
    case subtitle(text: String)
    case image(image: UIImage)
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
