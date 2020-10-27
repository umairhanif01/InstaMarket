//
//  SideMenuSubCatViewController.swift
//  InstaMarket
//
//  Created by Umair Hanif on 22/10/2020.
//

import UIKit

class SideMenuSubCatViewController: UIViewController {
    
    
    @IBOutlet weak var subCatTableView: UITableView!
    @IBOutlet weak var catTileLbl: UILabel!
    
    var catTitle = ""
    var subCatArray = ["Dresses", "Tops", "Sportswear", "Coats & Jackets", "Jeans", "Denim"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(catTitle)
        catTileLbl.text = catTitle
        
        self.navigationController?.navigationBar.isHidden = true
        
        subCatTableView.delegate = self
        subCatTableView.dataSource = self
        
        let tableViewCellNib = UINib(nibName: "SideMenuSubCatTableViewCell", bundle: nil)
        if let tableView = subCatTableView{
            
            tableView.register(tableViewCellNib, forCellReuseIdentifier: "SideMenuSubCatTableViewCell")
            tableView.backgroundColor = UIColor.clear.withAlphaComponent(0)
            
        }
        
    }
    
    
    @IBAction func backListener(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    
}

extension SideMenuSubCatViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subCatArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuSubCatTableViewCell") as? SideMenuSubCatTableViewCell {
           
            cell.titleLbl.text = subCatArray[indexPath.row]
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = ProductsViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
