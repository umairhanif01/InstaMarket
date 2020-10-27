//
//  ProfileViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 23/10/2020.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNavBar()
        
    }
    
    
    func initNavBar() {
        
        self.navigationItem.title = "Profile"
        
        let leftButton1 = UIButton()
        leftButton1.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        leftButton1.setImage(UIImage(named: "BackArrow"), for: .normal)
        leftButton1.addTarget(self, action: #selector(backBtnListener), for: .touchUpInside)
        
        let rightButton1 = UIButton()
        rightButton1.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        rightButton1.setImage(UIImage(named: "Setting"), for: .normal)
        rightButton1.addTarget(self, action: #selector(settingBtnListener), for: .touchUpInside)
        
        let backBtn = UIBarButtonItem(customView: leftButton1)
        let settingBtn = UIBarButtonItem(customView: rightButton1)
        
        self.navigationItem.leftBarButtonItem = backBtn
        self.navigationItem.rightBarButtonItem = settingBtn
    }
    
    @objc func backBtnListener() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func settingBtnListener() {
        self.navigationController?.pushViewController(SettingsViewController(), animated: true)
    }
    
    
    @IBAction func editProfileListener(_ sender: UIButton) {
        self.navigationController?.pushViewController(EditProfileViewController(), animated: true)
    }
    
    @IBAction func changePasswordListener(_ sender: UIButton) {
        self.navigationController?.pushViewController(ChangePasswordViewController(), animated: true)
    }
    
    
    
}
