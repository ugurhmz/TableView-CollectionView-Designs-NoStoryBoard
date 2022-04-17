//
//  TableCell.swift
//  (1)-TableView-StackView
//
//  Created by ugur-pc on 17.04.2022.
//

import UIKit

class TableCell: UITableViewCell {
    
    static var identifier = "TableCell"
    
    private let imgView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "a3")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let mytextLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.text = "StackView inside"
        label.textColor = .black
        return label
    }()
    
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        [imgView, stackView].forEach{ contentView.addSubview($0)}
        
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.borderWidth = 2
        
        
        [mytextLbl].forEach { stackView.addArrangedSubview($0)}
        
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("not imps")
    }

}

extension TableCell {
    
    private func setConstraints(){
        imgView.anchor(top: contentView.topAnchor,
                       leading: contentView.leadingAnchor,
                       bottom:contentView.bottomAnchor,
                       trailing: nil,
                       size: .init(width: 200, height: 0))
        
        
        stackView.anchor(top: contentView.topAnchor,
                         leading: imgView.trailingAnchor,
                         bottom: contentView.bottomAnchor,
                         trailing: contentView.trailingAnchor)
        
    }
}
