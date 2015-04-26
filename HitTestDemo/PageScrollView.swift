//
//  PageScrollView.swift
//  HitTestDemo
//
//  Created by Mudkip on 15/4/26.
//  Copyright (c) 2015年 Mudkip. All rights reserved.
//

import UIKit

class PageScrollView: UIScrollView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func hitTest(point: CGPoint, withEvent event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, withEvent: event)
        if let view = hitView {
            if view.isKindOfClass(TableHeaderView.self) {
                return nil
            }
        }
        return hitView
    }
}
