//
//  CollectionVC.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/7/21.
//

import Foundation

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - properties
    
    static var collectionViewId = "collectionViewCell"
    
    //MARK: - IBOutlets
    
    let myImageView: MyImageView = {
        let image = MyImageView()
        return image
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(myImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
    //MARK: - Set Layouts
    
//    override func layoutSubviews() {
//        myImageView.snp.makeConstraints { (make) in
//            make.edges.equalTo(self)
//        }
//    }
    
    
}
