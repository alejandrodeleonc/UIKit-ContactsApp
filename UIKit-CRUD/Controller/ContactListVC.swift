//
//  ContactListVC.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/6/21.
//

import SwiftUIFontIcon
import UIKit

class ContactListVC: UIViewController {
    
    var tableView = UITableView()
    var contacts:[Contact] = []
    var window: UIWindow?
    
    
    struct Cells {
        static let contactSell = "ContactCells"
        static let addSell = "AddImageCell"
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        let addButton = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(ContactListVC.addNewContact))
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(ContactListVC.deleteContacts))
        navigationItem.rightBarButtonItems = [deleteButton, addButton]
        navigationItem.backButtonTitle = "Cancel"
        navigationController?.navigationBar.tintColor = .black
        
        contacts = fetchData()
        configureTableView();
        
    }
    
    
    
    @objc func addNewContact(){
        print("add contact")
        
    }
    
    @objc func deleteContacts(){
        print("Delete contact ...")
    }
    
    
    func configureTableView(){
        
        print("configureTableView")
        view.addSubview(tableView)
        
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(ContactCell.self, forCellReuseIdentifier: Cells.contactSell)
        tableView.pin(to: view)
    }
    
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    


}



extension ContactListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.contactSell) as! ContactCell
        let contact = contacts[indexPath.row]
        cell.set(contact: contact)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactVC = ContactVC()
//        contactVC.contact = contacts[indexPath.row]
//        navigationController?.navigationItem.backBarButtonItem?.title = "Cancel"
//        navigationController?.pushViewController(contactVC, animated: true)
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }

}


extension ContactListVC{
    
    func fetchData() -> [Contact]{
        
        let contact  = Contact(image: Images.person!, name: "Persona 1", phone: "8095552111")
        
        return [contact, contact, contact, contact, contact, contact, contact, contact, contact, contact]
    }
}
