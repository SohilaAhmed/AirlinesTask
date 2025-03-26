//
//  AllAirlinesModel.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import Foundation

// MARK: - AllAirlinesModelElement
struct AirlinesModel: Codable {
    var site: String?
    var code, alliance, phone, name: String?
    var usName, clazz, defaultName, logoURL: String?

    enum CodingKeys: String, CodingKey {
        case site, code, alliance, phone, name, usName
        case clazz = "__clazz"
        case defaultName, logoURL
    }
}
 
