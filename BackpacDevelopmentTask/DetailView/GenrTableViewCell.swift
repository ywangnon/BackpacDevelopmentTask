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
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var genrScrollView: UIScrollView = {
        let scrollView = UIScrollView()
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
//        self.setAddSubViews()
//        self.setLayouts()
        self.setDelegates()
        self.setAddTargets()
        self.setGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewFoundations() {
        
    }
    
    func setAddSubViews() {
        self.addSubviews([
            self.genrView
        ])
        
        self.genrView.addSubviews([
            self.genrLabel,
            self.genrScrollView
        ])
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            self.genrView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            self.genrView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
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
        var xPosition: CGFloat = 0
        for i in 0..<genrs.count {
            let label = UILabel()
            label.text = genrs[i]
            label.layer.borderColor = UIColor.lightGray.cgColor
            label.layer.borderWidth = 1
            label.layer.cornerRadius = 5
            label.sizeToFit()
            
//            let xPosition = self.contentView.frame.width * CGFloat(i)
            
            label.frame = CGRect(x: xPosition,
                                 y: 0,
                                 width: label.frame.width,
                                 height: label.frame.height)
            xPosition += label.frame.width + 8
            self.genrScrollView.addSubview(label)
        }
        
        self.setAddSubViews()
        self.setLayouts()
    }
}
