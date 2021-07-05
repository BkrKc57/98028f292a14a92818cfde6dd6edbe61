//
//  SplashViewController.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 30.06.2021.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        APILayer.getStations { [weak self]  stations in
            guard let self = self else { return }
            ApplicationData.shared.stations = stations
            if let _: Data = LocalData.get(key: Spacecraft.LOCAL_KEY) {
                DispatchQueue.main.async {
                    AppRouter.push(from: self, to: TabBarViewController.self)
                }
            } else {
                DispatchQueue.main.async {
                    AppRouter.push(from: self, to: RegistrationViewController.self)
                }
            }
        }
    }

}
