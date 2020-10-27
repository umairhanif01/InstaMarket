//
//  SideMenuView.swift
//  InstaMarket
//
//  Created by Umair Hanif on 22/10/2020.
//

import UIKit

class SideMenuView: UIView {

    @IBOutlet weak var catTableView: UITableView!
    @IBOutlet weak var profileView: UIView!
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    func initTableViewWithCell() {
        let tableViewCellNib = UINib(nibName: "SideMenuCatTableViewCell", bundle: nil)
        if let tableView = catTableView{
            
            tableView.register(tableViewCellNib, forCellReuseIdentifier: "SideMenuCatTableViewCell")
            tableView.backgroundColor = UIColor.clear.withAlphaComponent(0)
            
        }
    }
    
    
}
