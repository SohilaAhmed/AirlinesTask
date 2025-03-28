//
//  AirlinesTableViewCell.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import UIKit
import SDWebImage

class AirlinesTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var airlineTitle: UILabel!
    @IBOutlet weak var isFavBtn: UIButton!
    
    var favPressed: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated) 
    }
    
    func cellSetup(data: AirlinesModel?){
        let link = "\(data?.site ?? "")\(data?.logoURL ?? "")"
        let url = URL(string: (link).addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) ?? "")
        self.img.sd_setImage(with: url, placeholderImage: UIImage(named: "airline (1)"))
        
        self.airlineTitle.text = data?.name ?? ""
        handelFav(selectedCode: data?.code ?? "")
    }
    
    func handelFav(selectedCode: String){
        var favAirlinesUseCase: FavAirlinesUseCase = FavAirlinesUseCase()
        let isFav = favAirlinesUseCase.checkIsFavAirline(selectedCode: selectedCode)
        isFav ? isFavBtn.setImage(UIImage.favouriteSelected, for: .normal) : isFavBtn.setImage(UIImage.favourite, for: .normal)
    }
    
    @IBAction func isFavPressed(_ sender: Any) {
        favPressed?()
    }
    
}
