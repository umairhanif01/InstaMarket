//
//  AuthView.swift
//  InstaMarket
//
//  Created by Umair Hanif on 22/10/2020.
//

import UIKit
import DropDown

class AuthView: UIView {

    
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var signView: UIView!
    @IBOutlet weak var registerScrollView: UIScrollView!
    @IBOutlet weak var genderTxtFld: UITextField!
    
    var delegate = AuthViewController()
    
    let genderDropDown = DropDown()

    @IBAction func segmentListener(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            signView.isHidden = false
            registerScrollView.isHidden = true
        }
        if sender.selectedSegmentIndex == 1 {
            registerScrollView.isHidden = false
            signView.isHidden = true
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        checkOnSegment()
        
        //genderTxtFld view & DropDown Handler
        genderTxtFld.rightViewMode = UITextField.ViewMode.always
        genderDropDown.anchorView = genderTxtFld
        genderDropDown.dataSource = ["Male", "Female", "Other"]
        genderTxtFld.delegate = self
        
        genderDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.genderTxtFld.text = item
        }
        
        let viewTap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.addGestureRecognizer(viewTap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    @IBAction func genderArrowBtnListener(_ sender: UIButton) {
        genderTxtFld.becomeFirstResponder()
    }
    
    func checkOnSegment() {
        if delegate.selectedSegment == 0 {
            signView.isHidden = false
            registerScrollView.isHidden = true
        }
        if delegate.selectedSegment == 1 {
            segment.selectedSegmentIndex = 1
            registerScrollView.isHidden = false
            signView.isHidden = true
        }
    }
    
}


extension AuthView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == genderTxtFld {
            self.endEditing(true)
            genderDropDown.show()
        }
    }
    
    
}
