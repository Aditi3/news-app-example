//
//  HNAppConstants.swift
//  HelloNews
//
//  Created by Aditi Agrawal on 19/12/20.
//  Copyright © 2020 Aditi Agrawal. All rights reserved.
//

import UIKit

struct HNAppConstants {
    
    struct API {
        static let newsApiKey = "a1c8863f03a74528b904487963a754b7"
        static let newsApiUrl = "https://newsapi.org/v2/top-headlines"
        static let countryCode = "us"
    }
    
    struct SegueIdentifier {
        static let articleDetailPage = "segue_goToURL"
    }
    
    struct CellIdentifier {
        static let article = "articleCellIdentifier"
    }
    
    
    
}
