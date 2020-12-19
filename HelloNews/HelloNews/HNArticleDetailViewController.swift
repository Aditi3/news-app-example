//
//  HNArticleDetailViewController.swift
//  HelloNews
//
//  Created by Aditi Agrawal on 19/12/20.
//  Copyright © 2020 Aditi Agrawal. All rights reserved.
//

import UIKit
import WebKit

class HNArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var article = Article()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
    }
    
    func setup() {
        webView.backgroundColor = .white
    }
    
    func loadData() {
        if let url = URL(string: article.url) {
            webView.load(URLRequest(url: url))
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
