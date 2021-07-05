//
//  UIViewController+Extension.swift
//  VNNEditor
//
//  Created by Emre Koc on 5.05.2021.
//

import Foundation
import UIKit

extension UIViewController {
    
    private static var dataAssocKey = 0
    
    /// Controller a gonderilecek olan bilgi burda tutulur
    var data: Decodable! {
        get {
            return objc_getAssociatedObject(self, &UIViewController.dataAssocKey) as? Decodable
        }
        set {
            objc_setAssociatedObject(self, &UIViewController.dataAssocKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
}
