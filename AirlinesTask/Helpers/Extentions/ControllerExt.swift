//
//  ControllerExt.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 28/03/2025.
//

import Foundation
import UIKit

extension UIViewController{
    func callNumber(_ phoneNumber: String) {
        let cleanedPhoneNumber = phoneNumber.replacingOccurrences(of: " ", with: "")
        
        guard !cleanedPhoneNumber.isEmpty else {
            print("Phone number is empty")
            AlertView.showAlert(view: self, title: "Error", message: "Phone number is empty") {
            }
            return
        }
        
        guard let url = URL(string: "tel://\(cleanedPhoneNumber)"),
              UIApplication.shared.canOpenURL(url) else {
            print("Cannot open phone URL with number \(cleanedPhoneNumber)")
            AlertView.showAlert(view: self, title: "Error", message: "Cannot open phone URL with number \(cleanedPhoneNumber)") {
            }
            return
        }
        
        UIApplication.shared.open(url, options: [:]) { success in
            if success {
                print("Calling \(cleanedPhoneNumber)")
            } else {
                print("Failed to initiate call to \(cleanedPhoneNumber)")
                AlertView.showAlert(view: self, title: "Error", message: "Failed to initiate call to \(cleanedPhoneNumber)") {
                }
            }
        }
    }
    
    
    func openURL(urlLink: String) {
        guard let url = URL(string: urlLink) else {
            print("Invalid URL: \(urlLink)")
            AlertView.showAlert(view: self, title: "Error", message: "Invalid URL: \(urlLink)") {
            }
            return
        }
        
        guard UIApplication.shared.canOpenURL(url) else {
            print("Cannot open URL: \(url)")
            AlertView.showAlert(view: self, title: "Error", message: "Cannot open URL: \(url)") {
            }
            return
        }
        
        UIApplication.shared.open(url, options: [:], completionHandler: { success in
            if success {
                print("Successfully opened URL: \(url)")
            } else {
                print("Failed to open URL: \(url)")
                AlertView.showAlert(view: self, title: "Error", message: "Failed to open URL: \(url)") {
                }
            }
        })
    }
}
