//
//  SideMenuViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 22/10/2020.
//

import UIKit
import SideMenu

class SideMenuViewController: UIViewController {
    
    @IBOutlet var mainView: SideMenuView!
    @IBOutlet weak var segments: UISegmentedControl!
    
    var catArray = ["Women Clothing", "Women Shoes", "Women Bags"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        mainView.catTableView.delegate = self
        mainView.catTableView.dataSource = self
        
        mainView.initTableViewWithCell()
        
        let profileTap = UITapGestureRecognizer(target: self, action: #selector(profileTapListener))
        mainView.profileView.addGestureRecognizer(profileTap)
        
    }
    
    
    @objc func profileTapListener() {
        let controller = ProfileNavigationController(rootViewController: ProfileViewController())
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func segmentsListener(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            catArray = ["Women Clothing", "Women Shoes", "Women Bags"]
            mainView.catTableView.reloadData()
        }
        if sender.selectedSegmentIndex == 1 {
            catArray = ["Men Clothing", "Men Shoes", "Men Bags"]
            mainView.catTableView.reloadData()
        }
        if sender.selectedSegmentIndex == 2 {
            catArray = ["Category1", "Category2", "Category3"]
            mainView.catTableView.reloadData()
        }
    }
    
    
}


extension SideMenuViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCatTableViewCell", for: indexPath) as? SideMenuCatTableViewCell {
            
            cell.titleLbl.text = catArray[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if let controller = self.parent as? SideMenuNavigationController {
            let subCatController = SideMenuSubCatViewController()
            subCatController.catTitle = catArray[indexPath.row]
            controller.setViewControllers([self, subCatController], animated: true)
            self.parent?.navigationController?.pushViewController(controller, animated: true)
        }
        
        
    }
    
    
}

