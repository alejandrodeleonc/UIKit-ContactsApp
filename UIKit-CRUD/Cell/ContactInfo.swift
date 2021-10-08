//
//  AddImageCell.swift
//  UIKit-CRUD
//
//  Created by Alejandro De León on 8/10/21.
//

import UIKit

class ContactIngfoCell: UITableViewCell {
    
    var imagefffView = UIImageView(image: UIImage(systemName: "person")!)
    
    var imageButton: UIButton = {

        let button = UIButton(type: .system)
        button.backgroundColor = .blue
        button.setTitle("click me", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = true
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = true

        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setImageView(){
        addSubview(imagefffView)
    }
}
