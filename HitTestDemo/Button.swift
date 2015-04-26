//
//  Button.swift
//  HitTestDemo
//
//  Created by Mudkip on 15/4/26.
//  Copyright (c) 2015年 Mudkip. All rights reserved.
//

import UIKit

class Button: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override func pointInside(point: CGPoint, withEvent event: UIEvent?) -> Bool {
        if !enabled || hidden {
            return super.pointInside(point, withEvent: event)
        }
        
        let edgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        let hitRect = UIEdgeInsetsInsetRect(bounds, edgeInsets)
        return CGRectContainsPoint(hitRect, point)
    }
}
