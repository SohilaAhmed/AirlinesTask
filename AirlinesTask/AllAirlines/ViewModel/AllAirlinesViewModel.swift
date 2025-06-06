//
//  AllAirlinesViewModel.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import Foundation

class AllAirlinesViewModel: AirlinesViewModelProtocol{
    var allAirlinesUseCase: AllAirlinesUseCase = AllAirlinesUseCase()
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
        let isFav = favAirlinesUseCase.checkIsFavAirline(selectedCode: airlinesData?[index.row].code ?? "")
        if isFav{
            favAirlinesUseCase.deleteFromFavAirline(selectedCode: airlinesData?[index.row].code ?? "")
        }else{
            if let airline = airlinesData?[index.row]{
                favAirlinesUseCase.saveToFavAirline(airlineData: airline)
            }
        }
        self.onSucess?()
    }
    
}

// MARK: -  APIs
extension AllAirlinesViewModel{
   // MARK: - getAirlines
    func getAirlines() {
        isLoading = true // Show activity indicator
        allAirlinesUseCase.getAllAirlines() { [weak self] result in
            self?.isLoading = false // Hide activity indicator
            switch result {
            case .success(let data):
                self?.airlinesData = data
                self?.onSucess?()
            case .failure(let error):
                if let error = error as? EtihadError {
                    self?.onError?(error.message.rawValue)
                }else{
                    self?.onError?((error as? ErrorModel)?.msg ?? "")
                }
            }
        }
    }
      
    
}
