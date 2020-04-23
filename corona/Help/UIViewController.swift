//
//  UIViewController.swift
//  Utility
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import UIKit

var ActivityIndicatorOverlayAssocKey: UInt8 = 0
extension UIViewController {
    
    ///MARK Klavyeyi ekranda bir yere tıklayarak kapatma
    public func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc public func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    /**************************************************/
    
  
    
   
    
    /**************************************************/
   
    public var activityIndicatorOverlay: UIView?
    {
        get
        {
            return objc_getAssociatedObject(self, &ActivityIndicatorOverlayAssocKey) as? UIView
        }
        
        set
        {
            objc_setAssociatedObject(self, &ActivityIndicatorOverlayAssocKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func showActivity()
    {
        if (self.activityIndicatorOverlay != nil)
        {
            return
        }
        
        let overlayView:UIView = UIView(frame: self.view.bounds)
        overlayView.backgroundColor = UIColor.init(white: 1.0, alpha: 0.3)
       
        let aiv = UIActivityIndicatorView(style: .whiteLarge)
        aiv.color = #colorLiteral(red: 0.172323823, green: 0.5255361199, blue: 0.9449802637, alpha: 1)
        aiv.center = CGPoint(x: self.view.bounds.size.width * 0.5, y: self.view.bounds.size.height * 0.5)
        aiv.startAnimating()
        overlayView.addSubview(aiv)
 
        self.view.addSubview(overlayView)
 
        self.activityIndicatorOverlay = overlayView
    }
    
    public func hideActivity()
    {
        if (self.activityIndicatorOverlay == nil)
        {
            return
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations:
            {
                self.activityIndicatorOverlay?.alpha = 0.0
        },
                       completion:
            { (b) in
                self.activityIndicatorOverlay?.removeFromSuperview()
                self.activityIndicatorOverlay = nil
        })
    }
}





