//
//  ProfileNavigationController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 23/10/2020.
//

import UIKit

class ProfileNavigationController: UINavigationController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavBar()
        
    }
    
    
    func initNavBar() {
        
        UINavigationBar.appearance().barTintColor = UIColor.white
        self.navigationBar.clipsToBounds = false
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.layer.shadowColor = UIColor.black.cgColor
        self.navigationBar.layer.shadowOpacity = 0.2
        self.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.navigationBar.layer.shadowRadius = 3
        self.navigationBar.layoutIfNeeded()
        
        
    }
    
    
    
}
