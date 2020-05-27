//
//  GenrTableViewCell.swift
//  BackpacDevelopmentTask
//
//  Created by Hansub Yoo on 2020/05/24.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit

class GenrTableViewCell: UITableViewCell {
    // MARK: 장르 영역
    var genrView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var genrLabel: UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        label.font = .preferredFont(forTextStyle: .title3)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var genrScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
        self.backgroundColor = .white
    }
    
    func setAddSubViews() {
        self.contentView.addSubviews([
            self.genrView
        ])
        
        self.genrView.addSubviews([
            self.genrLabel,
            self.genrScrollView
        ])
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            self.genrView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.genrView.bottomAnchor.constraint(equalTo: self.genrLabel.bottomAnchor, constant: 48),
            self.genrView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            self.genrView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.genrView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.genrLabel.topAnchor.constraint(equalTo: self.genrView.topAnchor, constant: 8),
            self.genrLabel.leadingAnchor.constraint(equalTo: self.genrView.leadingAnchor, constant: 8),
        ])
        self.genrLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.genrScrollView.leadingAnchor.constraint(equalTo: self.genrView.leadingAnchor),
            self.genrScrollView.topAnchor.constraint(equalTo: self.genrLabel.bottomAnchor, constant: 16),
            self.genrScrollView.widthAnchor.constraint(equalToConstant: self.contentView.frame.width),
            self.genrScrollView.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
    func setDelegates() {
        
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
    
    func setGenr(genrs: [String]?) {
        guard let genrs = genrs else {
            return
        }
        
        self.genrScrollView.contentSize = CGSize(width: self.contentView.frame.width * CGFloat(genrs.count),
                                                 height: self.genrScrollView.frame.height)
        var xPosition: CGFloat = 8
        for i in 0..<genrs.count {
            
            let genrLabel: UILabel = {
                let label = UILabel()
                label.text = "#" + genrs[i]
                return label
            }()
            genrLabel.sizeToFit()
            
            let genrView: UIView = {
                let view = UIView()
                view.layer.borderColor = UIColor.lightGray.cgColor
                view.layer.borderWidth = 1
                view.layer.cornerRadius = 5
                return view
            }()
            
            
            genrLabel.frame = CGRect(x: 4,
                                     y: 4,
                                     width: genrLabel.frame.width,
                                     height: genrLabel.frame.height)
            
            genrView.frame = CGRect(x: xPosition,
                                    y: 0,
                                    width: genrLabel.frame.width + 8,
                                    height: genrLabel.frame.height + 8)
            
            xPosition += genrView.frame.width + 8
            
            genrView.addSubview(genrLabel)
            self.genrScrollView.addSubview(genrView)
        }
    }
}
