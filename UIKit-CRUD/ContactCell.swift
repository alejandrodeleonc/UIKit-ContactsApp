//
//  ContactCell.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/6/21.
//

import UIKit

class ContactCell: UITableViewCell {
    var contactImageView  = UIImageView()
    var contactNameLabel  = UILabel()
    var contactPhoneLabel = UILabel()
    
//    var contactPhoneLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(contactImageView)
        addSubview(contactNameLabel)
//        addSubview(contactPhoneLabel)
        
        configureImageView()
        configureNameLabel()
        setImageConstraints()
        setNameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(contact: Contact){
        contactImageView.image = contact.image
        contactNameLabel.text = contact.name
        
    }
    
    
    func configureImageView(){
        contactImageView.layer.cornerRadius = 10
        contactImageView.clipsToBounds = true
    }
    
    func configureNameLabel(){
        contactNameLabel.numberOfLines = 0
        contactNameLabel.adjustsFontSizeToFitWidth = true
    }
    
//    func configurePhoneLabel(){
//
//    }
    
    func setImageConstraints(){
        contactImageView.translatesAutoresizingMaskIntoConstraints                                                  = false
        contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                                  = false
        contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive                    = true
        contactImageView.heightAnchor.constraint(equalToConstant: 80 ).isActive                                     = true
        contactImageView.widthAnchor.constraint(equalTo: contactImageView.heightAnchor, multiplier:  16/9).isActive = true
    }
    
    
    func setNameLabelConstraints(){
        contactImageView.translatesAutoresizingMaskIntoConstraints                                                  = false
        contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                                  = true
        contactImageView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20).isActive  = true
        contactImageView.heightAnchor.constraint(equalToConstant: 80).isActive                                      = true
        contactNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive                 = true
    }
    
}
