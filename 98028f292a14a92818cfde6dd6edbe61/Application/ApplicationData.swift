//
//  ApplicationData.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 30.06.2021.
//

import Foundation


class ApplicationData: NSObject {
    
    static let shared = ApplicationData()
    
    var stations: [Station]!
    
    override init() {
        super.init()
        
    }
}
