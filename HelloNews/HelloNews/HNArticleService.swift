//
//  HNArticleService.swift
//  HelloNews
//
//  Created by Aditi Agrawal on 18/12/20.
//  Copyright © 2020 Aditi Agrawal. All rights reserved.
//

import Foundation
import Alamofire

class HNArticleService {
    
    func fetchArticles(newsArticles : @escaping ([Article]) -> Void) {
        
        AF.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=a1c8863f03a74528b904487963a754b7", method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                
                case .success(let json):
                   
                    if let jsonDict = json as? [String:Any] {
                        print("Fetched Top Headlines Json: \(jsonDict)")
                        
                        if let jsonArticles = jsonDict["articles"] as? [[String:Any]] {
                            print("Fetched Top Headlines Json: \(jsonArticles)")
                            var articles = [Article]()
                            for jsonArticle in jsonArticles {
                                guard let title = jsonArticle["title"] as? String,
                                      let urlToImage = jsonArticle["urlToImage"] as? String,
                                      let url = jsonArticle["url"] as? String,
                                      let description = jsonArticle["description"] as? String
                                else {
                                    continue
                                }
                                let article = Article()
                                article.title = title
                                article.urlToImage = urlToImage
                                article.url = url
                                article.description = description
                                articles.append(article)
                            }
                            newsArticles(articles)
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}

class Article {
    var title = ""
    var urlToImage = ""
    var url = ""
    var description = ""
    var category : NewsCategory = .business
    var categoryColor = UIColor.red
}

enum NewsCategory : String {
    case business = "💼 Business"
    case entertainment = "🎭 Entertainment"
    case politics = "🎤 Politics"
    case sports = "🏀 Sports"
    case technology = "📱 Technology"
}

