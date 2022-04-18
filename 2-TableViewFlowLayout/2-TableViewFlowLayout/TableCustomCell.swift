//
//  TableCustomCell.swift
//  2-TableViewFlowLayout
//
//  Created by ugur-pc on 17.04.2022.
//

import UIKit

class TableCustomCell: UITableViewCell {
    
    static var identifier =  "TableCustomCell"
    var everyComingList = [String]()

    
    public var cellGeneralCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        cv.register(CollectionCell.self, forCellWithReuseIdentifier: CollectionCell.identifier)
        
        return cv
    }()
    
    
       
       override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           contentView.addSubview(cellGeneralCollectionView)
           cellGeneralCollectionView.fillSuperview()
           
           cellGeneralCollectionView.delegate = self
           cellGeneralCollectionView.dataSource = self
           
       }
       
       
       required init?(coder: NSCoder) {
           fatalError("not imps")
       }

}



//MARK: -
extension TableCustomCell {
    func configure(with comingModelFromVC: [String]) {
        self.everyComingList = comingModelFromVC
        
        DispatchQueue.main.async { [weak self] in
            self?.cellGeneralCollectionView.reloadData()
        }
    }
}


//MARK: - Delegate
extension TableCustomCell: UICollectionViewDelegate, UICollectionViewDataSource  {
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.everyComingList.count
    }
    
    
    
    // Gelen Her Farklı data, Burdan Diğer Cel'e, indexPath.row'u ile yollanıyor.
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.identifier, for: indexPath) as! CollectionCell
        
        collectionCell.configure(with: everyComingList[indexPath.row])
        
        return collectionCell
    }
    
}


//MARK: - FlowLayout
extension TableCustomCell: UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: contentView.frame.width / 2.5,
                      height: contentView.frame.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 55
    }
    
}
