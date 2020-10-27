//
//  WishlistViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 26/10/2020.
//

import UIKit
import SideMenu

class WishlistViewController: UIViewController {
    
    
    
    @IBOutlet var mainView: WishlistView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.wishlistCollectionView.delegate = self
        mainView.wishlistCollectionView.dataSource = self
        
        mainView.initCollectionViewWithCell()
        
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
        
    }
    
    @objc func shoppingBtnListener() {
        let controller = CartViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func searchBtnListener() {
        
    }
    
    
    
    
}


extension WishlistViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WishlistCollectionViewCell", for: indexPath) as? WishlistCollectionViewCell {

            return cell

        }

        return UICollectionViewCell()

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    


}

extension WishlistViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: self.view.frame.size.width / 2, height: 350)
    }

}

