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
     
    static let shared = CoreDataManager()
    private init() {}
    
    // MARK: - Core Data Context
    private var context: NSManagedObjectContext {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("AppDelegate not found")
        }
        return appDelegate.persistentContainer.viewContext
    }
    
    // MARK: - Save Airline to Core Data
    func saveAirlineToCoreData(data: AirlinesModel) {
        let myContext = context
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Airlines", in: myContext) else {
            print("Failed to retrieve entity description")
            return
        }
        
        let saveData = NSManagedObject(entity: entity, insertInto: myContext)
        saveData.setValue(data.code, forKey: "code")
        saveData.setValue(data.name, forKey: "name")
        saveData.setValue(data.phone, forKey: "phone")
        saveData.setValue(data.site, forKey: "site")
        saveData.setValue(data.logoURL, forKey: "logoURL")
        
        do {
            try myContext.save()
            print("Airline saved successfully!")
        } catch {
            print("Failed to save airline data: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Fetch Favorite Airlines
    func fetchFavAirlineFromCoreData() -> [AirlinesModel] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Airlines")
        var arrayOfAirlines: [AirlinesModel] = []
        
        do {
            let savedAirlines = try context.fetch(fetchRequest)
            arrayOfAirlines = savedAirlines.map { item in
                AirlinesModel(
                    site: item.value(forKey: "site") as? String,
                    code: item.value(forKey: "code") as? String,
                    phone: item.value(forKey: "phone") as? String,
                    name: item.value(forKey: "name") as? String,
                    logoURL: item.value(forKey: "logoURL") as? String
                )
            }
            print("Successfully fetched \(arrayOfAirlines.count) airlines")
        } catch {
            print("Failed to fetch airlines: \(error.localizedDescription)")
        }
        
        return arrayOfAirlines
    }
    
    // MARK: - Delete from Favorites
    func deleteFromFavCoreData(selectedCode: String) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Airlines")
        fetchRequest.predicate = NSPredicate(format: "code == %@", selectedCode)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let airlineToDelete = results.first {
                context.delete(airlineToDelete)
                try context.save()
                print("Successfully deleted airline with code: \(selectedCode)")
            } else {
                print("No matching airline found to delete")
            }
        } catch {
            print("Error deleting airline: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Check if Airline Exists
    func checkFavCoreData(selectedCode: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Airlines")
        fetchRequest.predicate = NSPredicate(format: "code == %@", selectedCode)
        
        do {
            let results = try context.fetch(fetchRequest)
            let exists = !results.isEmpty
            print(exists ? "Airline found in favorites" : "Airline not found in favorites")
            return exists
        } catch {
            print("Error checking airline existence: \(error.localizedDescription)")
            return false
        }
    }
}
