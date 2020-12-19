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
    
    @IBOutlet var containerView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLayout()
        layoutView()
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
        
        articleImageView?.contentMode = .center
        articleImageView?.layer.cornerRadius = 3.0
        articleImageView?.layer.shouldRasterize = true
        articleImageView?.layer.masksToBounds = true
    }
    
    func layoutView() {
        
        // set the shadow of the view's layer
        containerView?.layer.backgroundColor = UIColor.clear.cgColor
        containerView?.layer.shadowColor = UIColor.black.cgColor
        
        containerView?.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        containerView?.layer.shadowOpacity = 0.3
        containerView?.layer.shadowRadius = 3.0
        
        containerView?.layer.cornerRadius = 3.0
    }
    
    func setData(article: Article) {
        titleLabel?.text = article.title
        categoryLabel?.text = "  \(article.category.rawValue)  \u{200c}"
        
        categoryLabel?.backgroundColor = article.categoryColor
        let url = URL(string: article.urlToImage)
        articleImageView?.kf.setImage(with: url)
    }
    
}
