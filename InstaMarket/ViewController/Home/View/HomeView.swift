//
//  HomeView.swift
//  InstaMarket
//
//  Created by Umair Hanif on 22/10/2020.
//

import UIKit
import ZKCarousel

class HomeView: UIView {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sliderView: ZKCarousel!
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        initSlider()
        
    }
    
    func initSlider() {
        let slide = ZKCarouselSlide(image: UIImage(named: "SliderImage1"), title: "Hello There 👻", description: "Welcome to the ZKCarousel demo! Swipe left to view more slides!")
        let slide1 = ZKCarouselSlide(image: UIImage(named: "SliderImage1"), title: "A Demo Slide ☝🏼", description: "lorem ipsum devornum cora fusoa foen sdie ha odab ebakldf shjbesd ljkhf")
        let slide2 = ZKCarouselSlide(image: UIImage(named: "SliderImage1"), title: "Another Demo Slide ✌🏼", description: "lorem ipsum devornum cora fusoa foen ebakldf shjbesd ljkhf")
        
        // Add the slides to the carousel
        sliderView.slides = [slide, slide1, slide2]
    }
    
    func initCollectionViewWithCell() {
        let collectionViewCellNib = UINib(nibName: "NewProductsCollectionViewCell", bundle: nil)
        if let collectionView = collectionView{
            
            collectionView.register(collectionViewCellNib, forCellWithReuseIdentifier: "NewProductsCollectionViewCell")
            collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
            
        }
    }
    
}
