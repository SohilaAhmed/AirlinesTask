//
//  AirlineDetailsViewModelProrocol.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 27/03/2025.
//

import Foundation

protocol AirlineDetailsViewModelProrocol{
    var onSucess: (() -> ())? { get set }
    var onError: ((_ msg: String) -> ())? { get set }
    var showLoadingIndicator: ((_ isLoading: Bool) -> Void)? { get set }
 
    func getSiteLink() -> String
    func getName() -> String
    func getImgLink() -> String
    func getPhone() -> String
    func isFav() -> Bool
    
    func favAction()
}
