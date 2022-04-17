//
//  ViewController.swift
//  2-TableViewFlowLayout
//
//  Created by ugur-pc on 17.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    var rowTitles = ["Zero Header", "First Header", "Second Header"]
    
    
    var zeroImgArr = ["v1","v2","v5"]
    var firstImgArr = ["v2","v3","v1"]
    var secondImgArr = ["v5","v4","v2"]
    
    private let tableView: UITableView = {
        let tableView =  UITableView()
        tableView.backgroundColor = .white
        
        tableView.register(TableCustomCell.self,
                           forCellReuseIdentifier: TableCustomCell.identifier)
        return tableView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.fillSuperview()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}



//MARK: -
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return rowTitles.count
    }
    
    
    
    
    // HER CELL'e Aktarılan Farkılı data, Burdan Aktarılıyor.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = tableView.dequeueReusableCell(withIdentifier: TableCustomCell.identifier, for: indexPath) as! TableCustomCell
        
        switch indexPath.section  {
        case 0:
            tableCell.configure(with: zeroImgArr)
        case 1:
            tableCell.configure(with: firstImgArr)
        case 2:
            tableCell.configure(with: secondImgArr)
        default:
            return UITableViewCell()
        }
        
        return tableCell
    }
    
    
    
    
    // row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // Header Title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       
        switch section  {
        case 0:
           return "\(rowTitles[0])"
        case 1:
            return "\(rowTitles[1])"
        case 2:
            return  "\(rowTitles[2])"
        default:
            return "-"
        }
        
    }
    
    // Header Title Settings
    func tableView(_ tableView: UITableView,
                   willDisplayHeaderView view: UIView,
                   forSection section: Int) {
        guard let header  = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.font = .systemFont(ofSize: 22, weight: .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 2,
                                         y: header.bounds.origin.y,
                                         width: 130,
                                         height: header.bounds.height)
        header.textLabel?.textColor = .black
        header.textLabel?.text = header.textLabel?.text?.capitalized
        
        
    }
}
