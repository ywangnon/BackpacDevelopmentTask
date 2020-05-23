//
//  MainTableViewCell.swift
//  BackpacDevelopmentTask
//
//  Created by Hansub Yoo on 2020/05/23.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit
import Cosmos

class MainTableViewCell: UITableViewCell {
    var realContentsView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var sellerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var genrelabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ratingView: CosmosView = {
        let cosmosView = CosmosView()
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        return cosmosView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setDelegates()
        self.setAddTargets()
        self.setGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewFoundations() {
        self.backgroundColor = .gray
    }
    
    func setAddSubViews() {
        self.contentView.addSubviews([
            self.realContentsView
        ])
        
        self.realContentsView.addSubviews([
            self.titleImageView,
            self.appNameLabel,
            self.sellerNameLabel,
            self.lineView,
            self.genrelabel,
            self.priceLabel,
            self.ratingView
        ])
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            self.realContentsView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.realContentsView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            self.realContentsView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            self.realContentsView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            self.titleImageView.topAnchor.constraint(equalTo: self.realContentsView.topAnchor),
            self.titleImageView.leadingAnchor.constraint(equalTo: self.realContentsView.leadingAnchor),
            self.titleImageView.trailingAnchor.constraint(equalTo: self.realContentsView.trailingAnchor),
            self.titleImageView.heightAnchor.constraint(equalTo: self.titleImageView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.appNameLabel.topAnchor.constraint(equalTo: self.titleImageView.bottomAnchor, constant: 8),
            self.appNameLabel.leadingAnchor.constraint(equalTo: self.realContentsView.leadingAnchor, constant: 8)
        ])
        self.appNameLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.sellerNameLabel.topAnchor.constraint(equalTo: self.appNameLabel.bottomAnchor, constant: 4),
            self.sellerNameLabel.leadingAnchor.constraint(equalTo: self.appNameLabel.leadingAnchor)
        ])
        self.sellerNameLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.lineView.leadingAnchor.constraint(equalTo: self.realContentsView.leadingAnchor),
            self.lineView.trailingAnchor.constraint(equalTo: self.realContentsView.trailingAnchor),
            self.lineView.heightAnchor.constraint(equalToConstant: 1),
            self.lineView.topAnchor.constraint(equalTo: self.sellerNameLabel.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            self.genrelabel.topAnchor.constraint(equalTo: self.lineView.bottomAnchor, constant: 8),
            self.genrelabel.leadingAnchor.constraint(equalTo: self.appNameLabel.leadingAnchor)
        ])
        self.genrelabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo: self.genrelabel.bottomAnchor, constant: 8),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.appNameLabel.leadingAnchor)
        ])
        self.priceLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.ratingView.trailingAnchor.constraint(equalTo: self.realContentsView.trailingAnchor, constant: -8),
            self.ratingView.topAnchor.constraint(equalTo: self.genrelabel.topAnchor)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}
