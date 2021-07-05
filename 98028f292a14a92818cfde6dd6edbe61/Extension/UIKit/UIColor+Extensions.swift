//
//  UIColor+Extensions.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 5.07.2021.
//

import Foundation
import UIKit


extension UIColor {
  var customColor: UIColor {
    if #available(iOS 13.0, *) {
        return UIColor { (trait) -> UIColor in
            switch trait.userInterfaceStyle {
            case .dark:
                return UIColor.white
            default:
                return UIColor.black
            }
        }
    } else {
        // Fallback on earlier versions
        return UIColor.black
    }
  }
}
