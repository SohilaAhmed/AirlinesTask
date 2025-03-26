//
//  AllAirlinesViewController.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import UIKit

class AllAirlinesViewController: BaseViewController {

    @IBOutlet weak var airlinesTableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    
    var viewModel: AirlinesViewModelProtocol = AllAirlinesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Airlines"
        setTableView()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel.getAirlines()
    }
 
    private func bindViewModel() {
        viewModel.showLoadingIndicator = { [weak self] isLoading in
            DispatchQueue.main.async { [weak self]  in
                if isLoading {
                    self?.activityIndicatorView.startAnimating()
                } else {
                    self?.activityIndicatorView.stopAnimating()
                }
            }
        }
        
        viewModel.onSucess = { [weak self] in
            DispatchQueue.main.async { [weak self]  in
                self?.handelEmpty()
            }
        }
        
        viewModel.onError = { [weak self] errorMessage in
            DispatchQueue.main.async { [weak self]  in
                guard let self = self else {return}
                AlertView.showAlert(view: self, title: errorMessage, message: "") {
                }
            }
        }
    }
    
    func handelEmpty(){
        if viewModel.isEmptyData(){
            emptyView.isHidden = false
            airlinesTableView.isHidden = true
        }else{
            emptyView.isHidden = true
            airlinesTableView.isHidden = false
        }
        airlinesTableView.reloadData()
    }
}
