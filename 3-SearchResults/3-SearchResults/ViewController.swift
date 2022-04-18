//
//  ViewController.swift
//  3-SearchResults
//
//  Created by ugur-pc on 18.04.2022.
//

import UIKit

class ViewController: UIViewController{
  

 
    
    private let searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: SearchResultController())
        sc.searchBar.placeholder = "Searching..."
        return sc
    }()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        searchController.searchResultsUpdater = self
        setupViews()
    }
    
    private func setupViews(){
        
        
        if #available(iOS 13.0, *) {
                               let navBarAppearance = UINavigationBarAppearance()
                               //navBarAppearance.configureWithOpaqueBackground()
                           
                               navBarAppearance.backgroundColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
                               
//            navigationController?.navigationBar.barTintColor = .black
                               navigationController?.navigationBar.standardAppearance = navBarAppearance
                               navigationController?.navigationBar.compactAppearance = navBarAppearance
                               navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance

                               navigationController?.navigationBar.prefersLargeTitles = false
                               navigationItem.title = "Searching Jobs.."
            searchController.searchBar.searchTextField.backgroundColor = .black
            searchController.searchBar.tintColor = .systemPink
            searchController.searchBar.searchTextField.tintColor = .yellow
           

          }
      
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
    }
    
    
}

//MARK: -
extension ViewController:  UISearchResultsUpdating, UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(searchBar.text)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("x")
    }
    
    
}

