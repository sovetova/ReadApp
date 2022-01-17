//
//  helpers.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import UIKit

class Viewcustom: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 15
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.shadowRadius = 0.5
        layer.shadowOpacity = 0.5
    }
}
class CustomeButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.height * 0.5
    }
}
class ViewCustomize: UIView {
    
      override func layoutSubviews() {
          super.layoutSubviews()
          gradientLayer.frame = bounds
      }

      private lazy var gradientLayer: CAGradientLayer = {
          let l = CAGradientLayer()
          l.frame = self.bounds
          l.colors = [UIColor(hexString: "#56CCF2"), UIColor(hexString: "#2F80ED")]
          l.startPoint = CGPoint(x: 0, y: 0.5)
          l.endPoint = CGPoint(x: 1, y: 0.5)
          layer.insertSublayer(l, at: 0)
          return l
      }()
    
}
extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
extension CACornerMask {
    
    /// [.topLeft, .topRight, .BottomLeft, .BottomRight]
    static var all: CACornerMask {
        return [.topLeft, .topRight, .bottomLeft, .bottomRight]
    }
    /// layerMaxXMinYCorner
    static var topRight: CACornerMask {
        return .layerMaxXMinYCorner
    }
    /// layerMinXMinYCorner
    static var topLeft: CACornerMask {
        return .layerMinXMinYCorner
    }
    /// layerMinXMaxYCorner
    static var bottomLeft: CACornerMask {
        return .layerMinXMaxYCorner
    }
    /// layerMaxXMaxYCorner
    static var bottomRight: CACornerMask {
        return .layerMaxXMaxYCorner
    }
    /// [.bottomLeft, .bottomRight]
    static var allBottom: CACornerMask {
        return [.bottomLeft, .bottomRight]
    }
    /// [.topLeft, .topRight]
    static var allTop: CACornerMask {
        return [.topLeft, .topRight]
    }
    /// [.topRight, .bottomRight]
    static var allRight: CACornerMask {
        return [.topRight, .bottomRight]
    }
    /// [.bottomLeft, .bottomRight]
    static var allLeft: CACornerMask {
        return [.bottomLeft, .bottomRight]
    }
    
    /// all angles but `excluding`
    static func all(excluding: CACornerMask) -> CACornerMask {
        switch excluding {
        case .bottomLeft: return [.topLeft, .topRight, .bottomRight]
        case .bottomRight: return [.topLeft, .topRight, .bottomLeft]
        case .topLeft: return [.topRight, .bottomLeft, .bottomRight]
        case .topRight: return [.topLeft, .bottomLeft, .bottomRight]
        default: return .all
        }
    }
}
