//
//  ProductDetailViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 26/10/2020.
//

import UIKit
import SideMenu

class ProductDetailViewController: UIViewController {
    
    
    @IBOutlet var mainView: ProductDetailView!
    
    var sizeArray = ["28/30", "30/32", "32/34", "34/36", "36/38"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.initCollectionViewWithCell()
        
        mainView.sizeCollectionView.delegate = self
        mainView.sizeCollectionView.dataSource = self
        
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
        let controller = CartViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func searchBtnListener() {
        
    }
    
    
}


extension ProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSizeCollectionViewCell", for: indexPath) as? ProductSizeCollectionViewCell {

            cell.titleLbl.text = sizeArray[indexPath.row]
            
            
            return cell
        }

        return UICollectionViewCell()

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductSizeCollectionViewCell {
            cell.mainView.backgroundColor = UIColor(red: 62/255.0, green: 62/255.0, blue: 62/255.0, alpha: 1)
            cell.titleLbl.textColor = UIColor.white
            mainView.sizeLbl.text = cell.titleLbl.text
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? ProductSizeCollectionViewCell {
            cell.mainView.backgroundColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1)
            cell.titleLbl.textColor = UIColor(red: 126/255.0, green: 126/255.0, blue: 126/255.0, alpha: 1)
        }
    }
    
}

extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 90, height: 50)
    }

}
