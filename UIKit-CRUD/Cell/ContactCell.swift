//
//  ContactCell.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/6/21.
//

import UIKit

class ContactCell: UITableViewCell {
    var contactImageView  = UIImageView()
    var contactNameLabel  = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    var contactPhoneLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    var contactGreaterLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
    var horizontalSV = UIStackView()
    var verticalSV = UIStackView()
    
    
//    var contactPhoneLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureVerticalStack()
        configureHorizontalStack()
//        configureImageView()
//        configureNameLabel()
//        configurePhoneLabel()
//        setImageConstraints()
//        setNameLabelConstraints()
//        setPhoneLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(contact: Contact){
        contactImageView.image = contact.image
        contactNameLabel.text = contact.name
        contactPhoneLabel.text = contact.phone
        contactGreaterLabel.text = ">"
    }
    
    func configureHorizontalStack(){
        addSubview(horizontalSV)
        horizontalSV.axis              = .horizontal
        horizontalSV.distribution      = .fillEqually
        horizontalSV.spacing           = 50
        setHorizontalSVContraints()
        
        
        
        horizontalSV.addArrangedSubview(contactImageView)
        horizontalSV.addArrangedSubview(verticalSV)
        
        horizontalSV.addArrangedSubview(contactGreaterLabel)
    }
    func configureVerticalStack(){
        addSubview(horizontalSV)
        verticalSV.axis              = .vertical
        verticalSV.distribution      = .fillEqually
//        verticalSV.spacing           = 1
        
        
//        setHorizontalSVContraints()
        
//        horizontalSV.addArrangedSubview(contactImageView)
        verticalSV.addArrangedSubview(contactNameLabel)
        verticalSV.addArrangedSubview(contactPhoneLabel)
    }
    
    func setHorizontalSVContraints(){
        horizontalSV.translatesAutoresizingMaskIntoConstraints                                  = false
        horizontalSV.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive             = true
        horizontalSV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive     = true
        horizontalSV.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive       = true
        horizontalSV.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive             = true
    }
    
    func setVerticalSVContraints(){
        verticalSV.translatesAutoresizingMaskIntoConstraints                                               = false
        verticalSV.topAnchor.constraint(equalTo: horizontalSV.topAnchor, constant: 0).isActive             = true
        verticalSV.leadingAnchor.constraint(equalTo: horizontalSV.leadingAnchor, constant: 0).isActive     = true
        verticalSV.bottomAnchor.constraint(equalTo: horizontalSV.bottomAnchor, constant: 0).isActive       = true
        verticalSV.topAnchor.constraint(equalTo: horizontalSV.topAnchor, constant: 0).isActive             = true
    }
    
    func configureImageView(){
        contactImageView.layer.cornerRadius = 10
        contactImageView.clipsToBounds = true
    }
    
    func configureNameLabel(){
        contactNameLabel.numberOfLines = 0
        contactNameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configurePhoneLabel(){
        contactPhoneLabel.numberOfLines = 0
        contactPhoneLabel.textColor = .black
        contactPhoneLabel.adjustsFontSizeToFitWidth = true

    }
    
    func setImageConstraints(){
        contactImageView.translatesAutoresizingMaskIntoConstraints                                                  = false
        contactImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                                  = false
        contactImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive                    = true
        contactImageView.heightAnchor.constraint(equalToConstant: 80 ).isActive                                     = true
        contactImageView.widthAnchor.constraint(equalTo: contactImageView.heightAnchor, multiplier:  16/11).isActive = true
    }
    
    
    func setNameLabelConstraints(){
        contactNameLabel.translatesAutoresizingMaskIntoConstraints                                                  = false
        contactNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                                  = true
        contactNameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20).isActive  = true
        contactNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive                                      = true
        contactNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive                 = true
    }
    
    func setPhoneLabelConstraints(){
        contactPhoneLabel.translatesAutoresizingMaskIntoConstraints                                                  = false
        contactPhoneLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive                                  = true
        contactPhoneLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 20).isActive  = true
        contactPhoneLabel.topAnchor.constraint(equalTo: contactNameLabel.bottomAnchor, constant: 20)
        
//        contactPhoneLabel.heightAnchor.constraint(equalToConstant: 80).isActive                                      = true
//        contactPhoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive                 = true
    }
    
}
