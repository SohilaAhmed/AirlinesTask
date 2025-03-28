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
     
    // on boarding
    func getAllAirlines() -> String {
        return "https://www.kayak.com/h/mobileapis/directory/airlines"
    }
     
    
}

