//
//  Article.swift
//  MVVMGoodNews
//
//  Created by mac on 21.11.2020.
//

import Foundation

struct ArticleList: Decodable {
    let articles : [Article]
}


struct Article: Decodable {
    let title : String
    let description : String
}
