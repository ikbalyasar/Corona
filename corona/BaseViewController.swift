//
//  BaseViewController.swift
//  Corona
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import UIKit

protocol nextViewDelegate {
    func nextView()
}

class BaseViewController: UIViewController, nextViewDelegate {
   
    
   
     public var delegate: nextViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func addNavigationBarButton(imageName:String,direction:direction,nextPage:String="Next"){
        var image = UIImage(named: imageName)
        image = image?.withRenderingMode(.alwaysOriginal)
        switch direction {
        case .left:
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style:.plain, target: self, action: #selector(goBack))
        case .right:
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: nextPage , style:.plain, target: self, action: #selector(nextView))
            self.navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.9333333333, green: 0.3843137255, blue: 0.4235294118, alpha: 1)
        }
    }
    
    @objc func goBack() {
        _ = navigationController?.popViewController(animated: true)
        // _ = navigationController?.popToRootViewController(animated: true)
    }

    @objc func nextView() {
        
    }
  
    
    enum direction {
        case right
        case left
    }
}
