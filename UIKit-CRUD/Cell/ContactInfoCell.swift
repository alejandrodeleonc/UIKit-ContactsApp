//
//  AddImageCell.swift
//  UIKit-CRUD
//
//  Created by Alejandro De León on 8/10/21.
//

import UIKit

class ContactInfoCell: UITableViewCell {
    var contact: Contact?
    var atributeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    var textField: UITextField =  UITextField(frame: CGRect(x: 20, y: 100, width: 300, height: 40))
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        
            textField.layer.borderColor = UIColor.clear.cgColor
            textField.font = UIFont.systemFont(ofSize: 15)
            textField.borderStyle = UITextField.BorderStyle.roundedRect
            textField.autocorrectionType = UITextAutocorrectionType.no
            textField.keyboardType = UIKeyboardType.default
            textField.returnKeyType = UIReturnKeyType.done
            textField.clearButtonMode = UITextField.ViewMode.whileEditing
            textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            textField.delegate = self
            addSubview(textField)
            addSubview(atributeLabel)
        
            setLabelConstraints()
            setTextFieldConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setLabel(text: String){
        atributeLabel.text = text
        var placeHolder = ""
        if(self.contact != nil){

            switch (text){
            case "Nombre":
                placeHolder = self.contact?.name as! String
                break
            case "Apellido":
                placeHolder = self.contact?.lastName as! String
                break
            case "Telefono":
                placeHolder = self.contact?.phone as! String
                break
                
            default:
                placeHolder = ""
            }
        }
        textField.placeholder = placeHolder
            
        
    }
    
    func setLabelConstraints(){
        atributeLabel.translatesAutoresizingMaskIntoConstraints                                   = false
        atributeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive            = true
        atributeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive     = true
//        atributeLabel.font = UIFont.O
        atributeLabel.textColor = .gray
        atributeLabel.font = UIFont.systemFont(ofSize: 12)
    }
    
    
    func setTextFieldConstraints(){
        textField.translatesAutoresizingMaskIntoConstraints                                   = false
//        textField.widthAnchor.constraint(equalToConstant: 350).isActive = true
        textField.topAnchor.constraint(equalTo: atributeLabel.bottomAnchor, constant: 5).isActive            = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive     = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive     = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive     = true
    }
    
}


extension ContactInfoCell: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // return NO to disallow editing.
        print("TextField should begin editing method called")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        // became first responder
        print("TextField did begin editing method called")
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
        print("TextField should snd editing method called")
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
        print("TextField did end editing method called")
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("Termino de editar")
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        print("While entering the characters this method gets called")
        return true
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        // called when clear button pressed. return NO to ignore (no notifications)
        print("TextField should clear method called")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // called when 'return' key pressed. return NO to ignore.
        print("TextField should return method called")
        // may be useful: textField.resignFirstResponder()
        return true
    }

}
