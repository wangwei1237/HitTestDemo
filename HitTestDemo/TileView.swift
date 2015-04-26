//
//  TileView.swift
//  HitTestDemo
//
//  Created by Mudkip on 15/4/26.
//  Copyright (c) 2015年 Mudkip. All rights reserved.
//

import UIKit

@IBDesignable class TileView: UIView, UITableViewDataSource {
    
    var tableView: UITableView?
    @IBInspectable var placeholderText: String?
    @IBInspectable var cellColor: UIColor?
    
    override func awakeFromNib() {
        let tableView = UITableView(frame: bounds, style: .Plain)
        tableView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        tableView.backgroundColor = UIColor.clearColor()
        tableView.dataSource = self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let headerView = TableHeaderView()
        headerView.frame.size.height = 200
        tableView.tableHeaderView = headerView
        self.addSubview(tableView)
        self.tableView = tableView
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        cell.backgroundColor = UIColor.clearColor()
        if let text = placeholderText, color = cellColor {
            cell.textLabel?.text = text
            cell.backgroundColor = color
        }
        return cell
    }
}