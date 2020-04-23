//
//  CoronaViewController.swift
//  corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//


import Foundation
import UIKit


final class CoronaViewController : BaseViewController {
    private var listCorona: [List] = []
    @IBOutlet var tableView: UITableView!
    
    enum Constant{
        static var listCoronaDetail: [CountryStats]!
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.load()
    }
    
    var viewModel: CoronaViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationController?.navigationBar.titleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: "Nunito-SemiBold", size: 22)!]
        self.tabBarController?.navigationItem.title = "Covid - 19"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.updateBarTintColor()
    }
}

extension CoronaViewController : CoronaViewModelDelegate {
    func handleViewModelOutput(_ output: CoronaViewModelOutput) {
        switch output {
        case .setLoading(let isLoading):
            guard isLoading == true else {
                return self.hideActivity()
            }
            showActivity()
        case .showCoronaList(let listCorona):
            self.listCorona = listCorona
            print(listCorona[0].data.count)
            tableView.reloadData()
        }
    }
    
    func navigate(to route: CoronaRoute) {
        switch route {
        case .detail:
            let viewController = CoronaListDetailBuilder.make()
            show(viewController, sender: nil)
        }
    }
}


extension CoronaViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listCorona.count == 0 {
            /*
             tableView.setEmptyView(title: "You don't have any coupon".localized, message: "Your coupons will be in here".localized)
             */
            
        }
        else {
            /*
             tableView.restore()
             */
            return listCorona[0].data.count
        }
        
        return listCorona.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "coronaCell", for: indexPath) as? CoronaTableViewCell {
            
            if listCorona.count == 0 {
                
            }
            else {
                
                cell.updateUI(coronaList: listCorona[0].self,indexpath: indexPath.row)
            }
            
            
            return cell
        }
        else {
            return UITableViewCell()
        }
    }
}

extension CoronaViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if listCorona[0].data[indexPath.row].cityStats.count == 0 {
            
        } else {
            Constant.listCoronaDetail = listCorona[0].data[indexPath.row].cityStats
            self.viewModel.selectCity(indexpath: indexPath.row)
        }
    } 
}

extension UINavigationController {
    
    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        self.updateBarTintColor()
    }
    
    func updateBarTintColor() {
        if #available(iOS 13.0, *) {
            self.navigationBar.barTintColor = UITraitCollection.current.userInterfaceStyle == .dark ? .black : .white
        }
    }
}
