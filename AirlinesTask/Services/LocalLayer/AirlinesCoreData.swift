//
//  AirlinesCoreData.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    static var context: NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate not found")
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    static func saveAirlineToCoreData(data: AirlinesModel) {
        guard let myContext = context,
              let entity = NSEntityDescription.entity(forEntityName: "Airlines", in: myContext) else {
            return
        }
        
        do {
            let saveData = NSManagedObject(entity: entity, insertInto: myContext)
            saveData.setValue(data.code, forKey: "code")
            saveData.setValue(data.name, forKey: "name")
            saveData.setValue(data.phone, forKey: "phone")
            saveData.setValue(data.site, forKey: "site")
            saveData.setValue(data.logoURL, forKey: "logoURL")
            
            try myContext.save()
            print("Saved Successfully")
        } catch {
            print("Failed to save Movies data: \(error.localizedDescription)")
        }
    }
    
    static func fetchFavAirlineFromCoreData() -> [AirlinesModel] {
        guard let myContext = context else {
            return []
        }
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Airlines")
        var arrayOfAirlines: [AirlinesModel] = []
        
        do {
            let saved = try myContext.fetch(fetchRequest)
            for item in saved {
                let code = item.value(forKey: "code") as? String
                let name = item.value(forKey: "name") as? String
                let phone = item.value(forKey: "phone") as? String
                let site = item.value(forKey: "site") as? String
                let logoURL = item.value(forKey: "logoURL") as? String
                
                let savedData = AirlinesModel(site: site,
                                              code: code,
                                              phone: phone,
                                              name: name,
                                              logoURL: logoURL)
                arrayOfAirlines.append(savedData)
            }
        } catch {
            print("Failed to fetch Movies: \(error.localizedDescription)")
        }
        
        return arrayOfAirlines
    } 
    
    static func deleteFromFavCoreData(selectedCode: String){
        guard context != nil  else {
            return
        }
        do{
            let fetch = NSFetchRequest<NSManagedObject>(entityName: "Airlines")
            let predictt = NSPredicate(format: "code == %@", selectedCode)
            fetch.predicate = predictt
            
            let favProducts = try context?.fetch(fetch)
            
            guard let item = favProducts else {return}
            guard let itemFirst = item.first else {return}
            
            context?.delete(itemFirst)
            
            try context?.save()
            
            print("Deleted Succussfully")
            
        }catch let error
        {
            print(error.localizedDescription)
        }
    }
    
    static func checkFavCoreData(selectedCode: String) -> Bool{
        guard context != nil else {
            return false
        }
        
        do{
            let fetch = NSFetchRequest<NSManagedObject>(entityName: "Airlines")
            let predictt = NSPredicate(format: "code == %@", selectedCode)
            fetch.predicate = predictt
            
            let favProducts = try context?.fetch(fetch)
            
            guard let item = favProducts else {return false}
            guard let itemFirst = item.first else {return false}
            
            print("founded Succussfully")
            return true
            
        }catch let error
        {
            print(error.localizedDescription)
            return false
        }
    }
}
