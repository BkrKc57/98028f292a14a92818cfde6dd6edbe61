//
//  StationsResponse.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 30.06.2021.
//

import Foundation

struct StationsResponse: Decodable {
    var stations: [Station]
    
    init(from decoder: Decoder) throws {
          var container = try decoder.unkeyedContainer()
            stations = try container.decode([Station].self)
      }
}
