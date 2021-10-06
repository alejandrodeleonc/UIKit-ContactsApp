//
//  ContactListVC.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/6/21.
//

import UIKit

class ContactListVC: UIViewController {
    
    var tableView = UITableView()
    var contacts:[Contact] = []
    
    
    struct Cells {
        static let contactSell = "ContactCells"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mis contactos"
        contacts = fetchData()
        configureTableView();
        // Do any additional setup after loading the view.
    }
    
    
    func configureTableView(){
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
    
    
}


extension ContactListVC{
    
    func fetchData() -> [Contact]{
        
        let contact  = Contact(image: Images.person as! UIImage, name: "Persona 1", phone: "8095552111")
        
        return [contact, contact, contact, contact, contact, contact, contact, contact, contact, contact]
    }
}
