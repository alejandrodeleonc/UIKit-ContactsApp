//
//  SecondView.swift
//  UIKit-CRUD
//
//  Created by Alejandro De Leon on 10/7/21.
//

import UIKit

class SecondView: UIView {

//    MARK: - Properties
    let fullSize = UIScreen.main.bounds
    
    //MARK: - IBOutlets
    lazy var myCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: fullSize.width/2, height: fullSize.width/2)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.collectionViewId)
        return collectionView
    }()
    
    let addBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        return button
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(myCollectionView)
        addSubview(addBtn)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
