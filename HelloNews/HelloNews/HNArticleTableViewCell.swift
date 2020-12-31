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
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    var tintView = UIView()
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupLayout()
        layoutView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        DispatchQueue.main.async {
            self.tintView.frame = CGRect(x: 0, y: 0, width: self.articleImageView.frame.width, height:  self.articleImageView.frame.height)
        }
    }
    
    // MARK: - Setup Layout
    
    func setupLayout() {
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        titleLabel.numberOfLines = 3
        
        categoryLabel.textAlignment = .center
        categoryLabel.layer.cornerRadius = 3.0
        categoryLabel.layer.masksToBounds = true
        
        articleImageView.contentMode = .center
        articleImageView.layer.cornerRadius = 3.0
        articleImageView.layer.shouldRasterize = true
        articleImageView.layer.masksToBounds = true
        articleImageView.contentMode = .scaleAspectFill
        
        self.addOverlay(imageView: self.articleImageView!)
    }
    
    func layoutView() {
        // set the shadow of the view's layer
        containerView.layer.backgroundColor = UIColor.clear.cgColor
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowRadius = 3.0
        
        containerView.layer.cornerRadius = 3.0
    }
    
    // MARK: - Populate Data
    
    func setData(article: Article) {
        titleLabel.text = article.title
        
        categoryLabel.text = "  \(article.category.rawValue)  \u{200c}"
        categoryLabel.backgroundColor = article.categoryColor
        
        let url = URL(string: article.urlToImage)
        articleImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder_news"))
    }
    
    // MARK: - Extra Methods
    
    func addOverlay(imageView: UIImageView) {
        self.tintView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.tintView.frame = .zero
        imageView.addSubview(self.tintView)
    }
    
}
