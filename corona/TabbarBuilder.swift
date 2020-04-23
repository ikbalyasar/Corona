//
//  TabbarBuilder.swift
//  Corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation
import UIKit



final class TabbarBuilder {
    
    static func make() -> UITabBarController {
        let tabBarController = UITabBarController()
       
        let mapViewModel = MapBuilder.make()
        mapViewModel.tabBarItem.title = "Map".localized
        mapViewModel.tabBarItem.tag = 1
        mapViewModel.tabBarItem.image = UIImage(named: "ic_placeholder")?.withRenderingMode(.alwaysOriginal)
        mapViewModel.tabBarItem.selectedImage = UIImage(named: "ic_placeholderS")

        let coronaViewModel = CoronaBuilder.make()
        coronaViewModel.tabBarItem.title = "List".localized
        coronaViewModel.tabBarItem.tag = 2
        coronaViewModel.tabBarItem.image = UIImage(named: "ic_menu")?.withRenderingMode(.alwaysOriginal)
        coronaViewModel.tabBarItem.selectedImage = UIImage(named: "ic_menuS")
        
        
        tabBarController.viewControllers = [mapViewModel,coronaViewModel]
        return tabBarController
    }
}
