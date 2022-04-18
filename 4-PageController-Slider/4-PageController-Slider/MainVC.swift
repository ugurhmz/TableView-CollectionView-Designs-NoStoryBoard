//
//  ViewController.swift
//  4-PageController-Slider
//
//  Created by ugur-pc on 18.04.2022.
//

import UIKit

class MainVC: UIViewController{

    
    private let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
          
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        
        cv.register(MainTopCell.self,
                    forCellWithReuseIdentifier: MainTopCell.identifier)
        
        cv.register(MainBottomCell.self,
                    forCellWithReuseIdentifier: MainBottomCell.identifier)
        return cv
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.backgroundColor = .lightGray
        
        view.addSubview(mainCollectionView)
        mainCollectionView.fillSuperview()
        
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }


}


//MARK: - UICollectionViewDelegate
extension MainVC:  UICollectionViewDelegate, UICollectionViewDataSource  {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        // topCell
        if section == 0 {
            return 1
        }
        
        // bottomCell
        return 1
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let topCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainTopCell.identifier, for: indexPath) as! MainTopCell
            
            topCell.backgroundColor = .green
            return topCell
        }
        
        if indexPath.section == 1 {
            let bottomCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainBottomCell.identifier, for: indexPath) as! MainBottomCell
            
           
            return bottomCell
        }
        
        return UICollectionViewCell()
    }
    
    
    
    
}


//MARK: - DelegateFlowLayout
extension MainVC: UICollectionViewDelegateFlowLayout {
    
    
    
    // sizeForItemAt, cell -> w,h
      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          sizeForItemAt indexPath: IndexPath) -> CGSize {
          // topCell
          if indexPath.section == 0 {
              return CGSize(width: mainCollectionView.frame.width,
                            height: 350)
          }
          
          // bottomListcell
          return CGSize(width: mainCollectionView.frame.width,
                        height: mainCollectionView.frame.height)
          
      }
      
      func collectionView(_ collectionView: UICollectionView,
                          layout collectionViewLayout: UICollectionViewLayout,
                          insetForSectionAt section: Int) -> UIEdgeInsets {
          if section == 0 {
              return  .zero
          }
          
          return UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
      }
    
}
