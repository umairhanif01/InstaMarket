//
//  CartViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 26/10/2020.
//

import UIKit
import SideMenu

class CartViewController: UIViewController {
    
    
    @IBOutlet var mainView: CartView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.cartTableView.delegate = self
        mainView.cartTableView.dataSource = self
        
        mainView.initTableViewWithCell()
        
        initNavBar()
        
    }
    
    
    func initNavBar() {
        
        self.navigationItem.title = "Instamarket"
        self.navigationController?.navigationBar.clipsToBounds = true
        UINavigationBar.appearance().barTintColor = UIColor.white
        
        let leftButton1 = UIButton()
        leftButton1.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        leftButton1.setImage(UIImage(named: "MenuBars"), for: .normal)
        leftButton1.addTarget(self, action: #selector(menuBtnListener), for: .touchUpInside)
        
        let leftButton2 = UIButton()
        leftButton2.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        leftButton2.setImage(UIImage(named: "Heart"), for: .normal)
        leftButton2.addTarget(self, action: #selector(favoriteBtnListener), for: .touchUpInside)
        
        let rightButton1 = UIButton()
        rightButton1.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        rightButton1.setImage(UIImage(named: "Bag"), for: .normal)
        rightButton1.addTarget(self, action: #selector(shoppingBtnListener), for: .touchUpInside)
        
        let rightButton2 = UIButton()
        rightButton2.frame = CGRect(x: 0, y: 0, width: 30, height: 40)
        rightButton2.setImage(UIImage(named: "Search"), for: .normal)
        rightButton2.addTarget(self, action: #selector(searchBtnListener), for: .touchUpInside)
        
        
        
        let menuBtn = UIBarButtonItem(customView: leftButton1)
        let favoriteBtn = UIBarButtonItem(customView: leftButton2)
        let bagBtn = UIBarButtonItem(customView: rightButton1)
        let searchBtn = UIBarButtonItem(customView: rightButton2)
        
        self.navigationItem.leftBarButtonItems = [menuBtn, favoriteBtn]
        self.navigationItem.rightBarButtonItems = [bagBtn, searchBtn]
        
        //Enable swipe right to pop view controller
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
            let gestureRecognizer = UIPanGestureRecognizer()
            gestureRecognizer.setValue(targets, forKey: "targets")
            self.view.addGestureRecognizer(gestureRecognizer)
        }
        
    }
    
    
    @objc func menuBtnListener() {
        
        let controller = SideMenuNavigationController(rootViewController: SideMenuViewController())
        controller.leftSide = true
        controller.menuWidth = self.view.frame.size.width - 50
        self.present(controller, animated: true, completion: nil)
    }
    
    @objc func favoriteBtnListener() {
        let controller = WishlistViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func shoppingBtnListener() {
        
    }
    
    @objc func searchBtnListener() {
        
    }
    
}



extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cartTableViewCell") as? cartTableViewCell {
            
            
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        mainView.tableViewHeight.constant = tableView.contentSize.height
    }
    
    
}
