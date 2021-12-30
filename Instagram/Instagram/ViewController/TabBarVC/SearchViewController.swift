//
//  SearchViewController.swift
//  Instagram
//
//  Created by Anthony Ankit on 16/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class SearchViewController: InstagramBaseViewController {
    var searchBar:UISearchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.placeholder = "Search"
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        self.searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        self.searchBar.endEditing(true)
    }
}
