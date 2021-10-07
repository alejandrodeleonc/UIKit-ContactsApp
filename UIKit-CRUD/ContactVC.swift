//
//  ContactVC.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/7/21.
//

import UIKit

class ContactVC: UIViewController {
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
