//
//  HNArticleTableViewCell.swift
//  HelloNews
//
//  Created by Aditi Agrawal on 18/12/20.
//  Copyright © 2020 Aditi Agrawal. All rights reserved.
//

import UIKit
import Kingfisher

class HNArticleTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var categoryLabel: UILabel?
    @IBOutlet var articleImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupLayout() {
        titleLabel?.textAlignment = .left
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel?.numberOfLines = 3
        
        categoryLabel?.textAlignment = .center
        
        articleImageView?.contentMode = .scaleAspectFill
    }
    
    func setData(article: Article) {
        titleLabel?.text = article.title
        categoryLabel?.text = "  \(article.category.rawValue)  \u{200c}"
        
        categoryLabel?.backgroundColor = article.categoryColor
        let url = URL(string: article.urlToImage)
        articleImageView?.kf.setImage(with: url)
    }
    
}
