//
//  FavAirlinesViewModel.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 27/03/2025.
//

import Foundation

class FavAirlinesViewModel: AirlinesViewModelProtocol{
    
    var onSucess: (() -> ())?
    var onError: ((_ msg: String) -> ())?
    var showLoadingIndicator: ((_ isLoading: Bool) -> Void)?
       
    var isLoading: Bool = false {
        didSet {
            showLoadingIndicator?(isLoading)
        }
    }
    
    var airlinesData: [AirlinesModel]?
     
    // MARK: - get Airlines Data
    func getAirlinesDataCount() -> Int {
        airlinesData?.count ?? 0
    }
    
    func getAirlineDataByIndex(index: Int) -> AirlinesModel? {
        airlinesData?[index]
    }
    
    func isEmptyData() -> Bool {
        if airlinesData?.isEmpty ?? true{
            return true
        }else{
            return false
        }
    }
      
    func favAction(index: IndexPath){
        CoreDataManager.deleteFromFavCoreData(selectedCode: airlinesData?[index.row].code ?? "")
        getAirlines()
    }
    
}

// MARK: -  APIs
extension FavAirlinesViewModel{
   // MARK: - getAirlines
    func getAirlines() {
        airlinesData = CoreDataManager.fetchFavAirlineFromCoreData()
        onSucess?()
    }
      
    
}
