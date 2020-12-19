//
//  HCArticlesTableViewController.swift
//  HelloNews
//
//  Created by Aditi Agrawal on 18/12/20.
//  Copyright © 2020 Aditi Agrawal. All rights reserved.
//

import UIKit

class HNArticlesTableViewController: UITableViewController {
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
    }
    
    func setup() {
        tableView.separatorStyle = .none
    }
    
    func loadData() {
        HNArticleService().fetchArticles { (articles) in
            // Handle fetched articles
            print("Data is loaded, article count: \(articles.count)")
            self.articles = articles
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCellIdentifier", for: indexPath) as! HNArticleTableViewCell
        cell.selectionStyle = .none
        let article = self.articles[indexPath.row] as Article
        cell.setData(article: article)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        performSegue(withIdentifier: "segue_goToURL", sender: article)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue_goToURL" {
            if let article = sender as? Article {
                if let webVC = segue.destination as? HNArticleDetailViewController {
                    webVC.article = article
                }
            }
        }
    }
}
