//
//  MainTopCell.swift
//  4-PageController-Slider
//
//  Created by ugur-pc on 18.04.2022.
//

import UIKit

class MainTopCell: UICollectionViewCell {
    static var identifier =  "MainTopCell"
    
    var albumArr = ["a1","a2","a3","a4","a5","a6","a7"]
    
    
    
    // topGeneralCollectionView
      private let topGeneralCollectionView: UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .horizontal
          let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
          cv.showsHorizontalScrollIndicator = false
          cv.translatesAutoresizingMaskIntoConstraints = false
          cv.isPagingEnabled = true
          
          // register slider
          cv.register(MainSliderCell.self,
                      forCellWithReuseIdentifier: MainSliderCell.identifier)
          
          return cv
      }()
    
    var currenPage = 0
    
    // pageControl
     private let pageControl: UIPageControl = {
         let pageControl = UIPageControl()
         pageControl.currentPage = 0
         pageControl.numberOfPages = 5
         pageControl.currentPageIndicatorTintColor = .black
         pageControl.pageIndicatorTintColor = .yellow
         pageControl.translatesAutoresizingMaskIntoConstraints = false
         return pageControl
     }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       [ topGeneralCollectionView, pageControl].forEach { contentView.addSubview($0)}
        
        topGeneralCollectionView.fillSuperview()
        pageControl.centerXInSuperview()
        pageControl.anchor(top: nil,
                           leading: nil,
                           bottom: bottomAnchor,
                           trailing: nil,
                           padding: .init(top: 0, left: 0, bottom: 10, right: 0)
        )
        
        pageControl.numberOfPages = self.albumArr.count
        
        topGeneralCollectionView.backgroundColor = .lightGray
        topGeneralCollectionView.delegate = self
        topGeneralCollectionView.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("not imp")
    }
}


//MARK: -

//MARK: - Delegate, DataSource
extension MainTopCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    
    // paging
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / topGeneralCollectionView.frame.width)
    }
    
    
    // numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return albumArr.count
    }
    
    
    
    // cellForItemAt
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
        let cell = topGeneralCollectionView.dequeueReusableCell(withReuseIdentifier: MainSliderCell.identifier, for: indexPath) as! MainSliderCell
        
        //cell.backgroundColor = indexPath.row % 2 == 0 ? .purple : .systemPink
        cell.imgView.image = UIImage(named: "\(albumArr[indexPath.row])")
       
        
        return cell
    }
   
   
   
}




//MARK: - ViewDelegateFlowLayout
extension MainTopCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: topGeneralCollectionView.frame.width,
                      height: topGeneralCollectionView.frame.height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
  

}

