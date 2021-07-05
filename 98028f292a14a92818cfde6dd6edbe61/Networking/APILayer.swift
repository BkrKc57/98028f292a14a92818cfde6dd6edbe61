//
//  APILayer.swift
//  98028f292a14a92818cfde6dd6edbe61
//
//  Created by MacOS on 30.06.2021.
//

import Foundation


class APILayer {
    
    
    static let BASE_URL = "https://run.mocky.io"
    
    class func getStations(_ onCompletion: @escaping ((_ stations: [Station]) -> Void)) {
        let endpoint = "/v3/e7211664-cbb6-4357-9c9d-f12bf8bab2e2"
        guard let apiUrl: URL = URL(string: APILayer.BASE_URL + endpoint) else { return }
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: APILayerDelegate(), delegateQueue: nil)
        session.dataTask(with: apiUrl) { (data, response, error) in
            if let data = data {
                do {
                    if let stations = try? JSONDecoder().decode([Station].self, from: data) {
                        onCompletion(stations)
                    }
                } catch {
                    debugPrint("\(error)")
                }
            }
        }.resume()
    }
}

class APILayerDelegate: NSObject, URLSessionDelegate {
    public func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
           //Trust the certificate even if not valid
           let urlCredential = URLCredential(trust: challenge.protectionSpace.serverTrust!)

           completionHandler(.useCredential, urlCredential)
        }
}
