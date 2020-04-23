//
//  UIView.swift
//  Utility
//
//  Created by İkbal Yaşar on 30.03.2020.
//  Copyright © 2020 ikbSoft. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    ///Shadow
    public func addShadow(shadowColor: CGColor , shadowOffset: CGSize ,shadowOpacity: Float,shadowRadius: CGFloat, backroundColor:CGColor,cornerRadius:CGFloat,maskBounds:Bool) {
        layer.backgroundColor = backroundColor
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
        clipsToBounds = false
        layer.masksToBounds = maskBounds
    }
    
    // MARK:  Arka Plana Shadow verme
    public func addShadow(opacitiy : Float, shadowRadius:CGFloat, shadowOffsetWidth:Int, shadowOffsetHeight:Int, shadowColor: UIColor) {
        clipsToBounds = false
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = opacitiy
        self.layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        self.layer.shadowRadius = shadowRadius
       // self.layer.backgroundColor = backgroundColor.cgColor
        
    }

    public func addCornerRadius(cornerRadius:CGFloat) {
        self.layer.cornerRadius = cornerRadius
        clipsToBounds = false
    }
    
    public func addViewBorder(borderColor:CGColor,borderWith:CGFloat,borderCornerRadius:CGFloat){
        self.layer.borderWidth = borderWith
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = borderCornerRadius
        
    }
    
    public func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }

}



