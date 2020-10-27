//
//  IntroViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 22/10/2020.
//

import UIKit

class IntroViewController: UIViewController {
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedBtn: CustomButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPageView()
        
    }
    
    func initPageView() {
        
        let pages = createIntroPages()
        
        pageControl.numberOfPages = pages.count
        pageControl.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(pages.count), height: scrollView.frame.height)
        
        for index in 0 ..< pages.count {
            pages[index].frame = CGRect(x: UIScreen.main.bounds.width * CGFloat(index), y: 0, width: self.view.frame.size.width, height: scrollView.frame.height)
            scrollView.addSubview(pages[index])
        }
        scrollView.delegate = self
        
        
//        print("view Width = \(String(describing: self.view.frame.size.width))")
//        print("ScrollView Width = \(String(describing: scrollView.frame.width  * CGFloat(pages.count)))")
//        
//        print("view bounds Width = \(String(describing: UIScreen.main.bounds.width))")
        
    }
    
    
    func createIntroPages() -> [IntroView] {
        
        
        let introPage1 = Bundle.main.loadNibNamed("IntroView", owner: self, options: nil)?.first as! IntroView
        introPage1.introImageView.image = UIImage(named: "IntroPg1")
        introPage1.titleLbl.text = "New in for you"
        introPage1.descLbl.text = "Phasellus risus turpis, pretium sit amet magna non, molestie ultricies enim. Nullam pulvinar felis at metus malesuada."
        
        let introPage2 = Bundle.main.loadNibNamed("IntroView", owner: self, options: nil)?.first as! IntroView
        introPage2.introImageView.image = UIImage(named: "IntroPg2")
        introPage2.titleLbl.text = "Push Notifications"
        introPage2.descLbl.text = "Phasellus risus turpis, pretium sit amet magna non, molestie ultricies enim. Nullam pulvinar felis at metus malesuada."
        
        let introPage3 = Bundle.main.loadNibNamed("IntroView", owner: self, options: nil)?.first as! IntroView
        introPage3.introImageView.image = UIImage(named: "IntroPg3")
        introPage3.titleLbl.text = "Location"
        introPage3.descLbl.text = "Phasellus risus turpis, pretium sit amet magna non, molestie ultricies enim. Nullam pulvinar felis at metus malesuada."
        
        
        return [introPage1, introPage2, introPage3]
        
    }
    
    
    @IBAction func completionListener(_ sender: UIButton) {
        
        let controller = UINavigationController(rootViewController: WelcomeViewController())
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
        
        
    }
    
    
    
    
}

extension IntroViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.y = -scrollView.contentInset.top
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.size.width
        pageControl.currentPage = Int(pageNumber)
        if pageNumber > 1 {
            getStartedBtn.isHidden = false
        }
    }
}
