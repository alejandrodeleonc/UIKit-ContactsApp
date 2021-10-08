//
//  ContactVC.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/7/21.
//

import UIKit

class ContactVC: UIViewController {
<<<<<<< HEAD
    let firstView = FirstView()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBtnFuc()
        view = firstView
    }
    
    //MARK: - Functions
    
    func addBtnFuc() {
        firstView.myBtn.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
    }
    
    @objc func nextPage() {
        
    }
}
=======
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




 
>>>>>>> imagenRandom
