//
//  Article.swift
//  MVVMGoodNews
//
//  Created by mac on 21.11.2020.
//

import Foundation

class ArticleList: Decodable {
    let articles : [Article]
}


class Article: Decodable {
    let title : String
    let description : String
}
