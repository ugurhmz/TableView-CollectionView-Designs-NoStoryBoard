//
//  SearchResultController.swift
//  3-SearchResults
//
//  Created by ugur-pc on 18.04.2022.
//

import UIKit

class SearchResultController: UIViewController {

    
    public var searchResultCollectionView: UICollectionView = {
           let layout = UICollectionViewFlowLayout()
           layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 20,
                                    height: 200)
           layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
         
           var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
           
           // register
           collectionView.register(CustomCollectionCell.self,
                                   forCellWithReuseIdentifier: CustomCollectionCell.identifier)
           return collectionView
       }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        [searchResultCollectionView].forEach { view.addSubview($0)}
        searchResultCollectionView.fillSuperview()
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
    }
    
}

//MARK: - Delegate, DataSource
extension SearchResultController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.identifier, for: indexPath) as? CustomCollectionCell else {
                    return UICollectionViewCell()
                }
           
        cell.backgroundColor = indexPath.row % 2 == 0 ? .green:.orange
        cell.layer.cornerRadius = 15
        
        return cell
    }
}


//MARK: - UISearchResultsUpdating
extension SearchResultController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        let searchBar = searchController.searchBar
               
        guard let query = searchBar.text,
             !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3,
             
               let resultsController = searchController.searchResultsController as? SearchResultController else { return}
        
        print(query)
    }
    
    
}

