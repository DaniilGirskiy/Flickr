//
//  ViewController.swift
//  JSONParsingApp
//
//  Created by Danya on 12.02.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit
import Kingfisher
import FlickrNetworking

class PostsListViewController: UIViewController {
    
    // MARK: - Properties
    
    var router: Router! // injected
    var model: PostListModel! // injected
    
    @IBOutlet weak var tableView: UITableView!
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpSearchBar()
        setUpTableView()
        
        model.load()
    }
    
    // MARK: - Handlers
    
    private func setUpSearchBar() {
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.register(TableViewCell.self, forCellReuseIdentifier: "myCell")
    }
}


extension PostsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.fullposts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCell
        let photo = model.fullposts[indexPath.row]
    
        cell.myImageView.kf.setImage(with: photo.url)
        cell.likeLabel.isHidden = !photo.isLiked
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photoIndex = indexPath.row

        router.show(in: self, index: photoIndex)
    }
}

extension PostsListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}

extension PostsListViewController: PostListModelOutput {

    func updateViewFromModel() {
        tableView.reloadData()
        print("View updated from model")
    }
  
}
