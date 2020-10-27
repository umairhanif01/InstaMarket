//
//  CartView.swift
//  InstaMarket
//
//  Created by Umair Hanif on 26/10/2020.
//

import UIKit

class CartView: UIView {
    
    
    @IBOutlet weak var cartTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    func initTableViewWithCell() {
        let tableViewCellNib = UINib(nibName: "cartTableViewCell", bundle: nil)
        if let tableView = cartTableView{
            
            tableView.register(tableViewCellNib, forCellReuseIdentifier: "cartTableViewCell")
            tableView.backgroundColor = UIColor.white
            
        }
    }
    
}
