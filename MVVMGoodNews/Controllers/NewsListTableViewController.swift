//
//  NewsListTableViewController.swift
//  MVVMGoodNews
//
//  Created by mac on 18.11.2020.
//

import Foundation
import UIKit

class NewListTableViewController : UITableViewController {
    
    private var articleListViewModel : ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string : "https://newsapi.org/v2/top-headlines?country=us&apiKey=e2c22b419b3341d29ba0c6a8ffad503a")!
        
        WebService().getArticles(url: url) { articles in
            
            if let articles = articles {
                
                self.articleListViewModel = ArticleListViewModel(articles:articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell 
        else {
            fatalError("ArticleTableViewCell Not Found")
        }
        
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        return cell
    }
}

