//
//  ProductSizeCollectionViewCell.swift
//  InstaMarket
//
//  Created by Umair Hanif on 26/10/2020.
//

import UIKit

class ProductSizeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        mainView.backgroundColor = UIColor(red: 219/255.0, green: 219/255.0, blue: 219/255.0, alpha: 1)
        mainView.layer.cornerRadius = 5
        
    }

}
