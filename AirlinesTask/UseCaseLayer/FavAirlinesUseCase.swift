//
//  FavAirlinesUseCase.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 28/03/2025.
//

import Foundation

class FavAirlinesUseCase{
    
    func getFavAirlines() -> [AirlinesModel]{
        return CoreDataManager.shared.fetchFavAirlineFromCoreData()
    }
    
    func checkIsFavAirline(selectedCode: String)-> Bool{
        return CoreDataManager.shared.checkFavCoreData(selectedCode: selectedCode)
    }
    
    func saveToFavAirline(airlineData: AirlinesModel){
        CoreDataManager.shared.saveAirlineToCoreData(data: airlineData)
    }
    
    func deleteFromFavAirline(selectedCode: String){
        CoreDataManager.shared.deleteFromFavCoreData(selectedCode: selectedCode)
    }
    
    
}
