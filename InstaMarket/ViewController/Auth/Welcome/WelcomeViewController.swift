//
//  WelcomeViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 22/10/2020.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    
    @IBAction func signInListener(_ sender: Any) {
        self.navigationController?.pushViewController(AuthViewController(), animated: true)
    }
    
    @IBAction func registerListener(_ sender: Any) {
        let controller = AuthViewController()
        controller.selectedSegment = 1
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction func guestListener(_ sender: UIButton) {
        
        let controller = HomeNavigationViewController(rootViewController: HomeViewController())
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
        
    }
    
}
