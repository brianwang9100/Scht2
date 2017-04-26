//
//  Designables.swift
//  SchtGo
//
//  Created by Brian Wang on 4/21/17.
//  Copyright © 2017 BW. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton : UIButton {
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 0.5 * bounds.size.height
        clipsToBounds = true
    }
}
