//
//  AirlinesViewModelProtocol.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import Foundation


protocol AirlinesViewModelProtocol{
    var onSucess: (() -> ())? { get set }
    var onError: ((_ msg: String) -> ())? { get set }
    var showLoadingIndicator: ((_ isLoading: Bool) -> Void)? { get set }

//    // call apis
    func getAirlines() 
    
    // get Data
    func getAirlinesDataCount() -> Int
    func getAirlineDataByIndex(index: Int) -> AirlinesModel? 
    func isEmptyData() -> Bool 
    
    func favAction(index: IndexPath)
}
 
