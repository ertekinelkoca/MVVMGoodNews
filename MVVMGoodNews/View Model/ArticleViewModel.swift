//
//  ArticleViewModel.swift
//  MVVMGoodNews
//
//  Created by mac on 21.11.2020.
//

import Foundation

struct ArticleListViewModel {
    
    let articles: [Article]
    
}

extension ArticleListViewModel {
    
    var numberOfSections: Int{
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
    return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
    
}


struct ArticleViewModel {
    private let article: Article
}


//Here we're passing the article to the articleviewmodel
extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
    
}

extension ArticleViewModel {
        var title: String {
            return self.article.description
        }
    
        var description: String {
        return self.article.description
        }
}
