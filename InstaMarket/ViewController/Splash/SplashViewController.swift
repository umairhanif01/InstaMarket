//
//  SplashViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 22/10/2020.
//

import UIKit

class SplashViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let controller : IntroViewController = IntroViewController()
            self.navigationController?.pushViewController(controller, animated: true)
            self.removeFromParent()
        }
        
        
    }
    
    
    
    
    
}
