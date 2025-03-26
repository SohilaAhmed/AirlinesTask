//
//  BaseViewController.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {
    
    // activityIndicator
    var frame = CGRect()
    var activityIndicatorView = NVActivityIndicatorView(frame: CGRect())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frame = CGRect(x: self.view.frame.width / 2 , y: self.view.frame.height / 2, width: 0, height: 0)
        activityIndicatorView = NVActivityIndicatorView(frame: frame, type: .ballScale)
        activityIndicatorView.color = UIColor.gray
        activityIndicatorView.padding = 100
        self.view.addSubview(activityIndicatorView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    func setupNavBar(){
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.backgroundColor = .clear
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            
            let backItemAppearance = UIBarButtonItemAppearance()
            backItemAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear] // fix text color
            appearance.backButtonAppearance = backItemAppearance
            
            let image = UIImage(named: "arrow-left")!.withRenderingMode(.alwaysOriginal)
            
            appearance.setBackIndicatorImage(image, transitionMaskImage: image)
            
            UINavigationBar.appearance().tintColor = UIColor.black
            
            
            let font = UIFont.systemFont(ofSize: 16, weight: .medium)
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                              NSAttributedString.Key.font: font]
            
            navigationItem.titleView?.tintColor = .black
            
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            
        }
        
    }

}
