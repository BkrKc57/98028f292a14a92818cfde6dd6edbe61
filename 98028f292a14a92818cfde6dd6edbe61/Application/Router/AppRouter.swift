//
//  AppRouter.swift
//  TheMask
//
//  Created by Emre Koc on 2.04.2021.
//

import Foundation
import UIKit

class AppRouter {
    
    @discardableResult
    class func present<T: UIViewController>(from: UIViewController, to: T.Type, data: Decodable? = nil) -> UIViewController {
        let storyboardIdentifier: String = NSStringFromClass(to.self).components(separatedBy: ".").last!
        let storyboard = UIStoryboard(name: storyboardIdentifier.replacingOccurrences(of: "ViewController", with: ""), bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier)
        vc.modalPresentationStyle = .fullScreen
        vc.data = data
        let navVC: UINavigationController! = UINavigationController(rootViewController: vc)
        navVC.navigationBar.isTranslucent = false
        navVC.modalPresentationStyle = .fullScreen
        navVC.isNavigationBarHidden = true
        from.present(navVC, animated: true, completion: nil)
        return vc
    }
    
    @discardableResult
    class func push<T: UIViewController>(from: UIViewController, to: T.Type, data: Decodable? = nil) -> UIViewController {
        let storyboardIdentifier: String = NSStringFromClass(to.self).components(separatedBy: ".").last!
        let storyboard = UIStoryboard(name: storyboardIdentifier.replacingOccurrences(of: "ViewController", with: ""), bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: storyboardIdentifier)
        vc.modalPresentationStyle = .fullScreen
        vc.data = data
        from.navigationController?.pushViewController(vc, animated: true)
        return vc
    }
    
    
}
