//
//  UIView+Extension.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 25.06.2021.
//

import Foundation
import UIKit


extension UIView {
    func sketchShadow(color: UIColor = .black, alpha: Float = 0.4, x: CGFloat = 0, y: CGFloat = 20, blur: CGFloat = 20, spread: CGFloat = 0.39) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = alpha
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowRadius = blur / 2.0
//        self.layer.masksToBounds = true
        if spread == 0 {
            self.layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            self.layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
