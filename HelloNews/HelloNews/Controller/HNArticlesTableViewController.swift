//
//  HCArticlesTableViewController.swift
//  HelloNews
//
//  Created by Aditi Agrawal on 18/12/20.
//  Copyright © 2020 Aditi Agrawal. All rights reserved.
//

import UIKit

class HNArticlesTableViewController: UITableViewController {
    
    private var articles = [Article]()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
    }
    
    
    // MARK: - Setup
    
    private func setup() {
        tableView.separatorStyle = .none
    }
    
    
    // MARK: - Load Data
    
    private func loadData() {
        HNArticleService().fetchArticles { (articles) in
            // Handle fetched articles and Reload the Table
            print("Data is loaded, article count: \(articles.count)")
            self.articles = articles
            self.tableView.reloadData()
        }
    }
    
    
    // MARK: - Actions
    
    @IBAction func reloadTapped(_ sender: Any) {
        /// Request the Articles again and refresh the Article TableView
        loadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension;
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCellIdentifier", for: indexPath) as! HNArticleTableViewCell
        cell.selectionStyle = .none
        let article = self.articles[indexPath.row] as Article
        /// Update the Article Data for the Tableview Cell
        cell.setData(article: article)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// Pass the Selected Article Data to the WebView Controller
        let article = articles[indexPath.row]
        performSegue(withIdentifier: "segue_goToURL", sender: article)
    }
    
    
    // MARK: - Navigation
    
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
