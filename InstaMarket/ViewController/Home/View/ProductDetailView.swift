//
//  ProductDetailView.swift
//  InstaMarket
//
//  Created by Umair Hanif on 26/10/2020.
//

import UIKit

class ProductDetailView: UIView {
    
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    @IBOutlet weak var sizeLbl: UILabel!
    
    
    
    
    func initCollectionViewWithCell() {
        let collectionViewCellNib = UINib(nibName: "ProductSizeCollectionViewCell", bundle: nil)
        if let collectionView = sizeCollectionView{
            
            collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "ProductSizeCollectionViewCell")
            collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
            
        }
    }
    
    
}
