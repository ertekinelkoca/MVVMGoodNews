//
//  Webservice.swift
//  MVVMGoodNews
//
//  Created by mac on 20.11.2020.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error { 
                print(error.localizedDescription)
                print("data can not be fetched")
                completion(nil)
            }
            else if let data = data { 
                
                let articleList =  try? JSONDecoder().decode(ArticleList.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
