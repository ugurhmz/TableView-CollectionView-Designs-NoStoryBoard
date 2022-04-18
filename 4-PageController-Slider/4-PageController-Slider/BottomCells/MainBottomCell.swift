//
//  MainBottomCell.swift
//  4-PageController-Slider
//
//  Created by ugur-pc on 18.04.2022.
//

import UIKit

class MainBottomCell: UICollectionViewCell {
    static var identifier = "MainBottomCell"
    
    private let tableView: UITableView = {
            let tableView = UITableView()
            tableView.register(TableCell.self,
                               forCellReuseIdentifier: TableCell.identifier)
            return tableView
       }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(tableView)
        
        tableView.fillSuperview()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
    
}

//MARK: -

extension MainBottomCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 17
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier,
                                                 for: indexPath) as! TableCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

