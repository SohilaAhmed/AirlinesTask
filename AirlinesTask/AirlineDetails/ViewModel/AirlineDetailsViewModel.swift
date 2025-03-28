//
//  AirlineDetailsViewModel.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 27/03/2025.
//

import Foundation

class AirlineDetailsViewModel: AirlineDetailsViewModelProrocol{
    var favAirlinesUseCase: FavAirlinesUseCase = FavAirlinesUseCase()
    
    var onSucess: (() -> ())?
    var onError: ((_ msg: String) -> ())?
    var showLoadingIndicator: ((_ isLoading: Bool) -> Void)?
       
    var isLoading: Bool = false {
        didSet {
            showLoadingIndicator?(isLoading)
        }
    }
    
    // parese data from old screen
    var airlineData: AirlinesModel?
      
    init(airlineData: AirlinesModel?) {
        self.airlineData = airlineData 
    }
    
    func getSiteLink() -> String{
        airlineData?.site ?? ""
    }
    
    func getName() -> String{
        airlineData?.name ?? ""
    }
    
    func getImgLink() -> String{
        let link = "\(airlineData?.site ?? "")\(airlineData?.logoURL ?? "")"
        return link
    }
    
    func getPhone() -> String{
        // if phone foundend and not empety parese it if not use test number
        if let phone = airlineData?.phone, !(phone.isEmpty){
            phone
        }else{
            "12345678910"
        }
    }
    
    func isFav() -> Bool{
        let code = airlineData?.code ?? ""
        let isFav = favAirlinesUseCase.checkIsFavAirline(selectedCode: code)
        return isFav
    }
      
    func favAction(){
        // check if the item saved on core data or not
        let isFav = favAirlinesUseCase.checkIsFavAirline(selectedCode: airlineData?.code ?? "")
        if isFav{ // if it saved delete it
            favAirlinesUseCase.deleteFromFavAirline(selectedCode: airlineData?.code ?? "")
        }else{ // if it not saved save it
            if let airline = airlineData{
                favAirlinesUseCase.saveToFavAirline(airlineData: airline)
            }
        }
        
        // update ui
        self.onSucess?()
    }
    
}

 
