//
//  AllAirlinesUseCase.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import Foundation
import Alamofire

class AllAirlinesUseCase{
      
    func getAllAirlines(callBack: @escaping (Result<[AirlinesModel], Error>) -> Void) {
        
        Request.request(url: URLs.Instance.getAllAirlines(), 
                        method: .get,
                        parameters: nil,
                        encoding: URLEncoding.default,
                        headers: nil,
                        callBack: callBack)
    }
    
    
}
