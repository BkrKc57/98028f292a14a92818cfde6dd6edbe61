//
//  Decodable+Extensions.swift
//  TheMask
//
//  Created by Emre Koc on 6.04.2021.
//

import Foundation

extension Decodable {
    static func parse<T: Decodable>(data: String) -> T {
        let jsonData = data.data(using: .utf8)!
        return try! JSONDecoder().decode(T.self, from: jsonData)
    }
    
    static func parse<T: Decodable>(jsonData: Data) -> T {
        return try! JSONDecoder().decode(T.self, from: jsonData)
    }
}

extension Encodable {
    func toData() -> Data! {
        if let encoded = try? JSONEncoder().encode(self) {
            return encoded
        }
        return nil
    }
}
