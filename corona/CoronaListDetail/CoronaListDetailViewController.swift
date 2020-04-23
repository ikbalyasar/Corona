//
//  CoronaListDetailViewController.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//


import Foundation
import UIKit


final class CoronaListDetailViewController : BaseViewController {
    
    private var listCoronaDetail: [CountryStats]!
    @IBOutlet var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCoronaDetail = CoronaViewController.Constant.listCoronaDetail
    }
    var viewModel: CoronaListDetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
}

extension CoronaListDetailViewController : CoronaListDetailViewModelDelegate {
    func handleViewModelOutput(_ output: CoronaListDetailViewModelOutput) {
        
    }
    
    func navigate(to route: CoronaListDetailRoute) {
        
    }
}

extension CoronaListDetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listCoronaDetail.count == 0 {
        }
        else {
            return listCoronaDetail.count
        }
        
        return listCoronaDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "coronaDCell", for: indexPath) as? CoronaListDetailTableViewCell {
            
            if listCoronaDetail.count == 0 {
                
            }
            else {
                
                cell.updateUI(coronaList: listCoronaDetail,indexpath: indexPath.row)
              
            }
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
}

