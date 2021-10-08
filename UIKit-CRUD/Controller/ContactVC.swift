//
//  ContactVC.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/7/21.
//

import UIKit

class ContactVC: UIViewController {
    var contact: Contact?
    
    
    var addContactView  = AddContactV()
    
    var saveButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        title = "Nuevo contacto"
        view.addSubview(addContactView)
        addContactView.pin(to: view)

        
    }
}




 
