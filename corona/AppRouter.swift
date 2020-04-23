//
//  AppRouter.swift
//  Corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import UIKit

final class AppRouter {
    
    let window: UIWindow
    
    init() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start() {
        
        let viewController = TabbarBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.9647058824, green: 0.968627451, blue: 0.9764705882, alpha: 1)
        UINavigationBar.appearance().setBackgroundImage(UIImage(),for: .any,barMetrics: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
