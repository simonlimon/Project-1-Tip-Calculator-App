//
//  Circle.swift
//  teep
//
//  Created by Simon Posada Fishman on 6/14/16.
//  Copyright © 2016 Simon Posada Fishman. All rights reserved.
//

import UIKit

@IBDesignable class Circle: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
     @IBInspectable var color: UIColor = UIColor.blackColor()
    
    override func drawRect(rect: CGRect) {
        let path = UIBezierPath(ovalInRect: rect)
//        UIColor.init(red: 243/255.0, green: 228/255.0, blue: 184/255.0, alpha: 1.0).setFill()
        color.setFill()

        path.fill()
        
    }
    
    

}
