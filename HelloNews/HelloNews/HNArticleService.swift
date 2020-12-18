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
    
    func fetchArticle() {
        
        AF.request("https://newsapi.org/v2/top-headlines?country=us&apiKey=a1c8863f03a74528b904487963a754b7", method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                switch response.result {
                case .success(let json):
                    print("Fetched Top Headlines Json: \(json)")
                    DispatchQueue.main.async {
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}
