//
//  AuthViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 22/10/2020.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet var mainView: AuthView!
    var selectedSegment = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.delegate = self
        
    }
    
    
    
    
}
