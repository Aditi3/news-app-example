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
}