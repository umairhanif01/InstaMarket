//
//  ProductsView.swift
//  InstaMarket
//
//  Created by Umair Hanif on 26/10/2020.
//

import UIKit

class ProductsView: UIView {
    
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
    
    func initCollectionViewWithCell() {
        let collectionViewCellNib = UINib(nibName: "ProductsCollectionViewCell", bundle: nil)
        if let collectionView = productsCollectionView{
            
            collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "ProductsCollectionViewCell")
            collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
            
        }
    }
    
    
}
