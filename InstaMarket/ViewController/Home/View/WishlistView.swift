//
//  WishlistView.swift
//  InstaMarket
//
//  Created by Umair Hanif on 26/10/2020.
//

import UIKit

class WishlistView: UIView {
    
    
    @IBOutlet weak var wishlistCollectionView: UICollectionView!
    
    func initCollectionViewWithCell() {
        let collectionViewCellNib = UINib(nibName: "WishlistCollectionViewCell", bundle: nil)
        if let collectionView = wishlistCollectionView{
            
            collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "WishlistCollectionViewCell")
            collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
            
        }
    }
    
}
