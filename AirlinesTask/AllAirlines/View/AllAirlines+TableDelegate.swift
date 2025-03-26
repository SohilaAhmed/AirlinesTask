//
//  AllAirlines+TableDelegate.swift
//  AirlinesTask
//
//  Created by Sohila Ahmed on 26/03/2025.
//

import UIKit

extension AllAirlinesViewController: UITableViewDelegate , UITableViewDataSource {
    func setTableView() {
        airlinesTableView.delegate = self
        airlinesTableView.dataSource = self
        airlinesTableView.register(UINib(nibName: "AirlinesTableViewCell", bundle: nil), forCellReuseIdentifier: "AirlinesTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getAirlinesDataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AirlinesTableViewCell", for: indexPath) as? AirlinesTableViewCell else { return UITableViewCell() }
        cell.cellSetup(data: viewModel.getAirlineDataByIndex(index: indexPath.row))
        cell.favPressed = { [weak self] in
            self?.viewModel.favAction(index: indexPath)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
     
}

