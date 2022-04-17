//
//  ViewController.swift
//  (1)-TableView-StackView
//
//  Created by ugur-pc on 17.04.2022.
//

import UIKit


class ViewController: UIViewController {

    private let tableView: UITableView = {
         let tableView = UITableView()
        tableView.register(TableCell.self,
                           forCellReuseIdentifier: TableCell.identifier)
         return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.backgroundColor = .lightGray
        tableView.fillSuperview()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.identifier,
                                                 for: indexPath) as! TableCell
        cell.backgroundColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

