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
        titleLabel?.textAlignment = .center
        categoryLabel?.textAlignment = .left
        articleImageView?.contentMode = .scaleAspectFit
    }
    
    func setData(article: Article) {
        titleLabel?.text = article.title
        categoryLabel?.text = article.category.rawValue
        let url = URL(string: article.urlToImage)
        articleImageView?.kf.setImage(with: url)
    }
    
}
