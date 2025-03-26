//
//  AlertView.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import Foundation
import UIKit

class AlertView: NSObject {
    class func showAlert(view: UIViewController , title: String , message: String, success:@escaping () -> Void?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK",comment: ""), style: UIAlertAction.Style.default, handler: { action in
            success()
        }))
        view.present(alert, animated: true, completion: nil)
    }
    
    class func showAlertWithCompletion(view: UIViewController, title: String, message: String, success:@escaping () -> Void, failure:@escaping () -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel",comment: ""), style: .cancel, handler: { action in
            failure()
        }))
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK",comment: ""), style: .default, handler: { action in
            success()
        }))
        
        view.present(alert, animated: true)
    }
    
    class func showAlertWithCompletionChooseBtnNames(view: UIViewController, title: String, message: String, BtnName: String, cancelName: String, success:@escaping () -> Void, failure:@escaping () -> Void) {
         
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelName, style: .cancel, handler: { action in
         failure()
        }))
        
        alert.addAction(UIAlertAction(title: BtnName, style: .default, handler: { action in
            success()
        }))
        
        view.present(alert, animated: true)
    }
    
      
    
     
}
