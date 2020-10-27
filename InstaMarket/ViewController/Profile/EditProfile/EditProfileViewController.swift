//
//  EditProfileViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 23/10/2020.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    @IBOutlet var mainView: EditProfileView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initNavBar()
        
        
    }
    
    
    func initNavBar() {
        
        self.navigationItem.title = "Edit Profile"
        
        let leftButton1 = UIButton()
        leftButton1.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        leftButton1.setImage(UIImage(named: "BackArrow"), for: .normal)
        leftButton1.addTarget(self, action: #selector(backBtnListener), for: .touchUpInside)
        
        let backBtn = UIBarButtonItem(customView: leftButton1)
        
        self.navigationItem.leftBarButtonItem = backBtn
        
        //Enable swipe right to pop view controller
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
            let gestureRecognizer = UIPanGestureRecognizer()
            gestureRecognizer.setValue(targets, forKey: "targets")
            self.view.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    @objc func backBtnListener() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
