//
//  CollectionCell.swift
//  2-TableViewFlowLayout
//
//  Created by ugur-pc on 17.04.2022.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    static var  identifier = "CollectionCell"
    
    private let imgView: UIImageView = {
           let iv = UIImageView()
           iv.image = UIImage(named: "a3")
           iv.contentMode = .scaleAspectFill
           iv.clipsToBounds = true
           return iv
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [imgView].forEach{ contentView.addSubview($0)}
        
        imgView.anchor(top: contentView.topAnchor,
                              leading: contentView.leadingAnchor,
                              bottom:contentView.bottomAnchor,
                       trailing: contentView.trailingAnchor)
    }
     
     
     required init?(coder: NSCoder) {
         fatalError("not imps")
     }
    
}


extension CollectionCell {
    
    func configure(with comingModel: String) {
        self.imgView.image =  UIImage(named: "\(comingModel)")
    }
}
