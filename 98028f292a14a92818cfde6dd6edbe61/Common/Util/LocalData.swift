//
//  LocalData.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 30.06.2021.
//

import Foundation

class LocalData {
    
    class func set(key: String, value: Any) {
        UserDefaults.standard.setValue(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    class func get<T>(key: String) -> T? {
        return UserDefaults.standard.object(forKey: key) as? T
    }
    
    class func remove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
}
