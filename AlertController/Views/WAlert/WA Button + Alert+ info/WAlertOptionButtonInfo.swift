import QuartzCore

struct WAlertOptionButtonInfo {
    let title: String
    let cornersToRound: [WalertOptionbuttonCorner]
}

enum WalertOptionbuttonCorner {
    
    case bottomLeft
    case bottomRight
    
    func toCACornerMask() -> CACornerMask {
            switch self {
            case .bottomLeft:
                return .layerMinXMaxYCorner
            case .bottomRight:
                return .layerMaxXMaxYCorner
            }
        }
}

extension Array where Element == WalertOptionbuttonCorner {
    
    func toCACornerMask() -> CACornerMask {
        var mask: CACornerMask = []
        for corner in self {
            mask.insert(corner.toCACornerMask())
        }
        return mask
    }
}
