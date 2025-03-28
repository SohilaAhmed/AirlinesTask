//
//  FavAirlinesViewModel.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 27/03/2025.
//

import Foundation

class FavAirlinesViewModel: AirlinesViewModelProtocol{
    var favAirlinesUseCase: FavAirlinesUseCase = FavAirlinesUseCase()
    
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
        // in fav screen so the action is just delete
        favAirlinesUseCase.deleteFromFavAirline(selectedCode: airlinesData?[index.row].code ?? "")
        getAirlines()
    }
     
}
 
extension FavAirlinesViewModel{
   // MARK: - getAirlines
    func getAirlines() {
        // get saved data from core data
        airlinesData = favAirlinesUseCase.getFavAirlines()
        // update ui
        onSucess?()
    }
}
