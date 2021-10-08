//
//  AddContactV.swift
//  UIKit-CRUD
//
//  Created by Alejandro De León on 7/10/21.
//

import UIKit

class AddContactV: UIView {
    //MARK: - Stacks Views
    var tableView = UITableView()
    
    struct Cells {
        static let contactSell = "ContactCells"
        static let addSell = "AddImageCells"
    }
    
    //MARK: - Labels
    var contactNameLabel  = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//    var contactPhoneLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
//    var contactGreaterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        
        configureTableView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureTableView(){
        
        
        addSubview(tableView)
        
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(ContactCell.self, forCellReuseIdentifier: Cells.addSell)
        
        
        tableView.pin(to: self)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }



}

extension AddContactV: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        return UITableViewCell()
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let contactVC = ContactVC()
//        contactVC.contact = contacts[indexPath.row]
//        navigationController?.navigationItem.backBarButtonItem?.title = "Cancel"
//        navigationController?.pushViewController(contactVC, animated: true)
//    }
}

    //MARK: - Set Constraints
    
   
//    func configureVerticalStack(){
//        addSubview(verticalSV)
//        verticalSV.backgroundColor = .yellow
//        verticalSV.axis              = .vertical
//        verticalSV.distribution      = .fillEqually
//
////        verticalSV.pin(to: view)
//        verticalSV.addArrangedSubview(imageV)
//        verticalSV.addArrangedSubview(fieldsSV)
//        verticalSV.addArrangedSubview(buttonSV)
//        setImageViewContraints()
////        verticalSV.addSubview(contactPhoneLabel)
//    }
//
//    func setImageViewContraints(){
////        imageV.axis = .vertical
////        imageSV.distribution = .fillEqually
//
//
//
//        imageV.addArrangedSubview(imageView)
//        imageV.addArrangedSubview(imageButton)
//
////        imageView.translatesAutoresizingMaskIntoConstraints                                  = false
//
//        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
////        imageView.centerXAnchor.constraint(equalTo: imageSV.centerXAnchor).isActive = true
////        imageView.centerYAnchor.constraint(equalTo: imageSV.centerYAnchor).isActive = true
////
//        configureImageButton()
//
//
//    }
//
//    func configureImageButton(){
//
//        imageButton.backgroundColor = .green
////        imageButton.anchor(top: imageSV.topAnchor, left: imageSV.leftAnchor, bottom: imageSV.bottomAnchor, right: imageSV.trailingAnchor, paddingTop: 100, paddingLeft: 60, paddingBottom: 0, paddingRight: 0, width: 90, height: 90)
//        imageButton.layer.cornerRadius = imageButton.layer.bounds.size.width/2;
//        imageButton.clipsToBounds = true;
////        imageButton.translatesAutoresizingMaskIntoConstraints                                  = false
////        imageButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
//    }
//
//    func setVerticalSVContraints(){
//        verticalSV.translatesAutoresizingMaskIntoConstraints                                  = false
//        verticalSV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive             = true
//        verticalSV.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive     = true
//        verticalSV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive       = true
//        verticalSV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive             = true
//        verticalSV.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive   = true
//    }
//
//
//    func setImageSVConstraints(){
//
//        imageSV.translatesAutoresizingMaskIntoConstraints                                  = false
//        imageSV.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive             = true
//        imageSV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive     = true
//        imageSV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive       = true
//        imageSV.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive             = true
//        imageSV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive   = true
//    }
    
//    func setNameLabelConstraints(){
//        saveButton.translatesAutoresizingMaskIntoConstraints                                                  = false
//        saveButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                                  = true
//        saveButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 20).isActive  = true
//        saveButton.heightAnchor.constraint(equalToConstant: 80).isActive                                      = true
//        saveButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive                 = true
//    }
//}
