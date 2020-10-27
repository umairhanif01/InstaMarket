//
//  EditProfileView.swift
//  InstaMarket
//
//  Created by Umair Hanif on 23/10/2020.
//

import UIKit
import DropDown
import FlagPhoneNumber

class EditProfileView: UIView {
    
    
    @IBOutlet weak var genderTxtFld: UITextField!
    @IBOutlet weak var phoneCodeTxtFld: FPNTextField!
    @IBOutlet weak var phoneNumberTxtFld: UITextField!
    
    let genderDropDown = DropDown()
    
    override func draw(_ rect: CGRect) {
        
//        phoneCodeTxtFld.placeholder = ""
//        phoneCodeTxtFld.hasPhoneNumberExample = false
        
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
    
    
    
    
}

extension EditProfileView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == genderTxtFld {
            self.endEditing(true)
            genderDropDown.show()
        }
    }
    
    
}
