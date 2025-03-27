//
//  AirlineDetailsViewController.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 27/03/2025.
//

import UIKit

class AirlineDetailsViewController: BaseViewController {

    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var siteBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    
    var viewModel: AirlineDetailsViewModelProrocol = AirlineDetailsViewModel(airlineData: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = ""
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "\(viewModel.getName())"
        self.setupData()
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
                self?.setupData()
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
     
    @IBAction func favPressed(_ sender: Any) {
        viewModel.favAction()
    }
    
    @IBAction func sitePressed(_ sender: Any) {
        openURL(urlLink: viewModel.getSiteLink())
    }
    
    @IBAction func phonePressed(_ sender: Any) {
        callNumber(viewModel.getPhone())
    }
}

extension AirlineDetailsViewController{
    func setupData(){
        let imgLink = viewModel.getImgLink()
        let url = URL(string: (imgLink).addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) ?? "")
        self.img.sd_setImage(with: url, placeholderImage: UIImage(named: "airline (1)"))
        
        viewModel.isFav() ? favBtn.setImage(UIImage.favouriteSelected, for: .normal) : favBtn.setImage(UIImage.favourite, for: .normal)
        
        name.text = viewModel.getName()
        phoneBtn.setTitle(viewModel.getPhone(), for: .normal)
        siteBtn.setTitle(viewModel.getSiteLink(), for: .normal)
    }
}

