//
//  HNArticleService.swift
//  HelloNews
//
//  Created by Aditi Agrawal on 18/12/20.
//  Copyright © 2020 Aditi Agrawal. All rights reserved.
//

import Foundation
import DocumentClassifier
import Alamofire

class HNArticleService {
    
    /// Fetches the News data- More information: https://newsapi.org/docs
    ///
    /// - Parameters:
    ///   - success: returns Article if the data was fetched successfully from the API
    func fetchArticles(newsArticles : @escaping ([Article]) -> Void) {
        
        let newsUrl = "\(HNAppConstants.API.newsApiUrl)?country=\(HNAppConstants.API.countryCode)&apiKey=\(HNAppConstants.API.newsApiKey)"
        
        AF.request(newsUrl, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                
                case .success(let json):
                    
                    if let jsonDict = json as? [String:Any] {
                        
                        print("Fetched Top Headlines Json: \(jsonDict)")
                        
                        if let jsonArticles = jsonDict["articles"] as? [[String:Any]] {
                            print("Fetched Top Headlines Json: \(jsonArticles)")
                            /// Parses fetched articles json data to an object of type Article
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
                                /// Create an Array of the articles
                                articles.append(article)
                                
                                /// Classify the category based on title and description using DocumentClassifier - For more Information: https://github.com/toddkramer/DocumentClassifier
                                guard let classification = DocumentClassifier().classify(title + description) else { return }
                                
                                switch (classification.prediction.category) {
                                case .business:
                                    article.category = .business
                                    article.categoryColor = UIColor(red: 0.298, green: 0.882, blue: 0.949, alpha: 1.00)
                                case .entertainment:
                                    article.category = .entertainment
                                    article.categoryColor = UIColor(red: 0.129, green: 0.788, blue: 0.588, alpha: 1.00)
                                case .sports:
                                    article.category = .sports
                                    article.categoryColor = UIColor(red: 0.996, green: 0.847, blue: 0.325, alpha: 1.00)
                                case .politics:
                                    article.category = .politics
                                    article.categoryColor = UIColor(red: 0.929, green: 0.667, blue: 0.169, alpha: 1.00)
                                case .technology:
                                    article.category = .technology
                                    article.categoryColor = UIColor(red: 0.949, green: 0.396, blue: 0.220, alpha: 1.00)
                                }
                            }
                            
                            /// Update the UI and Data on the Main Thread
                            DispatchQueue.main.async {
                                newsArticles(articles)
                            }
                        }
                    }
                case .failure(let error):
                    print("Something went wrong while fetching the News Articles:\(error)")
                }
            }
    }
    
}

/// Article Model
class Article {
    var title = ""
    var urlToImage = ""
    var url = ""
    var description = ""
    var category : NewsCategory = .business
    var categoryColor = UIColor.red
}

/// News Category enum
enum NewsCategory : String {
    case business = "💼 Business"
    case entertainment = "🎭 Entertainment"
    case politics = "🎤 Politics"
    case sports = "🏀 Sports"
    case technology = "📱 Technology"
}

