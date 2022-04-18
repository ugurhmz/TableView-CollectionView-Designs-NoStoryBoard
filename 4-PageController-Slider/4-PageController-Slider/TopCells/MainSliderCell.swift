//
//  MainSliderCell.swift
//  4-PageController-Slider
//
//  Created by ugur-pc on 18.04.2022.
//

import UIKit

class MainSliderCell: UICollectionViewCell {
    
    static var identifier  = "MainSliderCell"
    
    
    
    
    public var imgView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "v6")
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
     
     
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imgView)
        imgView.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
}
