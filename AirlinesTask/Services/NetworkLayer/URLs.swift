//
//  URLs.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import Foundation
import Alamofire

class URLs {
    static let Instance = URLs()
    private init() {}
    
    func getHeader(withContent: Bool) -> HTTPHeaders {
        var header: [HTTPHeader] = [
             
        ]
        if withContent {
            header.append(HTTPHeader.contentType("application/json"))
            header.append(HTTPHeader.accept("application/json"))
        }
        return HTTPHeaders(header)
    }
     
      
    // on boarding
    func getAllAirlines() -> String {
        return "https://www.kayak.com/h/mobileapis/directory/airlines"
    }
     
    
}

