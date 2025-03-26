//
//  Request.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import Foundation
import Alamofire
import UIKit

class Request {
    
    class func request<T: Codable>(url: String,
                                   method: HTTPMethod, 
                                   parameters: Parameters?,
                                   encoding: ParameterEncoding,
                                   headers: HTTPHeaders?,
                                   callBack:@escaping (Result<T, Error>) -> Void) {
        
        let jsonDecodeer = JSONDecoder()
        
        print(url)
        URLCache.shared.removeAllCachedResponses()
        let newUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        AF.request(newUrl, method: method, parameters: parameters, encoding: encoding, headers: headers).validate().responseDecodable(of: T.self) { (response) in
            
            print(response.result)
            //            print(response.data)
            print(response)
            //            print(response.response)
            switch response.result {
            case .success:
                if let _ = response.data {
                    guard let resultData = response.data else { fatalError() }
                    do {
                        let basicResponse = try jsonDecodeer.decode(T.self, from: resultData)
                        print(basicResponse)
                        callBack(.success(basicResponse))
                    }
                    catch(let error) {
                        print(error)
                        let requestError = EtihadError(statusCode: 200, message: .decodingError)
                        callBack(.failure(requestError))
                    }
                }
            case .failure(let error):
                if (error.responseCode ?? 800) < 500 {
                    guard let resultData = response.data else { fatalError() }
                    do {
                        let basicResponse = try jsonDecodeer.decode(ErrorModel.self, from: resultData)
                        print(basicResponse)
                        callBack(.failure(basicResponse))
                    }
                    catch(let error) {
                        print(error)
                        print(error.localizedDescription)
                        
                        let requestError = EtihadError(statusCode: 200, message: .decodingError)
                        callBack(.failure(requestError))
                    }
                }else if error.responseCode != nil{
                    print(error)
                    print(error.localizedDescription)
//                    print(error.failedStringEncoding)
                    print(error.isResponseSerializationError)
                    let requestError = EtihadError(statusCode: response.response?.statusCode ?? 800, message: .serverError)
                    callBack(.failure(requestError))
                }else{
                    print(error)
                    print(error.localizedDescription)
//                    print(error.failedStringEncoding)
                    print(error.isResponseSerializationError)
                    let requestError = EtihadError(statusCode: response.response?.statusCode ?? 800, message: .InternetError)
                    callBack(.failure(requestError))
                }
            }
        }
    }
    
    
}

