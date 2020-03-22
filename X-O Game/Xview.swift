//
//  Xview.swift
//  X-O Game
//
//  Created by saad on 3/17/20.
//  Copyright © 2020 X-O Game. All rights reserved.
//

import UIKit

 @IBDesignable class XButton : UIButton {

 @IBInspectable var CornerRadius : CGFloat = 0 {
     didSet {
         self.layer.cornerRadius = CornerRadius
     }
    

 } }

@IBDesignable class Xlabel : UILabel {
    
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}


