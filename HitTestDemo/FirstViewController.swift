//
//  FirstViewController.swift
//  HitTestDemo
//
//  Created by Mudkip on 15/4/26.
//  Copyright (c) 2015年 Mudkip. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var headerHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftTileView: TileView!
    @IBOutlet weak var middleTileView: TileView!
    @IBOutlet weak var rightTileView: TileView!
    @IBOutlet weak var scrollView: PageScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        leftTileView.tableView?.delegate = self
        middleTileView.tableView?.delegate = self
        rightTileView.tableView?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func currentTileView() -> TileView {
        let index = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
        switch index {
            case 1: return middleTileView
            case 2: return rightTileView
            default: return leftTileView
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if scrollView == currentTileView().tableView {
            if scrollView.contentOffset.y < 0 {
                headerHeightConstraint.constant = 200 - scrollView.contentOffset.y
            } else {
                headerHeightConstraint.constant = 200
            }
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView == self.scrollView && !decelerate {
            scrollViewDidEndDecelerating(scrollView)
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            scrollViewDidScroll(currentTileView().tableView!)
        }
    }
}