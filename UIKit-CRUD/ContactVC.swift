//
//  ContactVC.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/7/21.
//

import UIKit

class ContactVC: UIViewController {
    
    var contact: Contact?
    var mainST = UIStackView()
    
    var saveButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureMainStack()
    }
    
    
    func configureMainStack(){
        view.addSubview(mainST)
        mainST.axis              = .vertical
        mainST.distribution      = .fillEqually
        mainST.spacing           = 10

        mainST.pin(to: view)
        
        
        
//        horizontalSV.addArrangedSubview(contactImageView)
          mainST.addArrangedSubview(saveButton)
//        horizontalSV.addArrangedSubview(contactGreaterLabel)
    }


}
