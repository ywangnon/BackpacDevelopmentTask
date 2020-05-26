//
//  DetailTableViewCell.swift
//  BackpacDevelopmentTask
//
//  Created by Hansub Yoo on 2020/05/24.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    var defaultView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: 미리보기 이미지 스크롤
    var imgScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    // MARK: 기본 정보 영역(앱 이름, 셀러, 가격, 링크)
    var defaultInfoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var sellerLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .subheadline)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: 웹에서 보기와 공유하기 테두리
    var linkAreaView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var linkAreaCenterLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var webButton: UIButton = {
        let button = UIButton()
        button.setTitle("웹에서 보기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("공유하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: 추가 정보 영역
    var additionalInfoAreaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var sizeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var sizeLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var sizeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "크기"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var sizeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var ageLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var ageTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "연령"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var ageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var releaseNotesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var releaseNotesLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var releaseNotesTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 기능"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var releaseNotesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var releaseNotesImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    var releaseNotesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var releaseNotesDescriptionLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var releaseNotesDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: 설명
    var appDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionLabelHeight: NSLayoutConstraint?
    
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
            self.defaultView
        ])
        
        self.defaultView.addSubviews([
            self.imgScrollView,
            self.defaultInfoView,
            self.additionalInfoAreaView,
            self.releaseNotesDescriptionLabel,
            self.appDescriptionLabel
        ])
        
        self.defaultInfoView.addSubviews([
            self.appNameLabel,
            self.sellerLabel,
            self.priceLabel,
            self.linkAreaView
        ])

        self.linkAreaView.addSubviews([
            self.webButton,
            self.shareButton,
            self.linkAreaCenterLineView
        ])

        self.additionalInfoAreaView.addSubviews([
            self.sizeView,
            self.ageView,
            self.releaseNotesView
        ])

        self.sizeView.addSubviews([
            self.sizeLineView,
            self.sizeTitleLabel,
            self.sizeLabel
        ])

        self.ageView.addSubviews([
            self.ageLineView,
            self.ageTitleLabel,
            self.ageLabel,
        ])

        self.releaseNotesView.addSubviews([
            self.releaseNotesLineView,
            self.releaseNotesTitleLabel,
            self.releaseNotesLabel,
            self.releaseNotesImageView,
            self.releaseNotesDescriptionLineView,
            self.releaseNotesButton
        ])
    }
    
    func setLayouts() {
        NSLayoutConstraint.activate([
            self.defaultView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.defaultView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.defaultView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            self.defaultView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.imgScrollView.topAnchor.constraint(equalTo: self.defaultView.topAnchor),
            self.imgScrollView.leadingAnchor.constraint(equalTo: self.defaultView.leadingAnchor),
            self.imgScrollView.widthAnchor.constraint(equalTo: self.defaultView.widthAnchor),
            self.imgScrollView.heightAnchor.constraint(equalToConstant: self.contentView.frame.width)
        ])
        
        NSLayoutConstraint.activate([
            self.defaultInfoView.topAnchor.constraint(equalTo: self.imgScrollView.bottomAnchor),
            self.defaultInfoView.leadingAnchor.constraint(equalTo: self.defaultView.leadingAnchor),
            self.defaultInfoView.trailingAnchor.constraint(equalTo: self.defaultView.trailingAnchor),
            self.defaultInfoView.bottomAnchor.constraint(equalTo: self.linkAreaView.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            self.appNameLabel.leadingAnchor.constraint(equalTo: self.defaultInfoView.leadingAnchor, constant: 8),
            self.appNameLabel.topAnchor.constraint(equalTo: self.defaultInfoView.topAnchor, constant: 8)
        ])
        self.appNameLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.sellerLabel.leadingAnchor.constraint(equalTo: self.appNameLabel.leadingAnchor),
            self.sellerLabel.topAnchor.constraint(equalTo: self.appNameLabel.bottomAnchor, constant: 4)
        ])
        self.sellerLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo: self.sellerLabel.bottomAnchor, constant: 8),
            self.priceLabel.leadingAnchor.constraint(equalTo: self.appNameLabel.leadingAnchor)
        ])
        self.priceLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.linkAreaView.leadingAnchor.constraint(equalTo: self.defaultView.leadingAnchor, constant: 8),
            self.linkAreaView.trailingAnchor.constraint(equalTo: self.defaultView.trailingAnchor, constant: -8),
            self.linkAreaView.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 16),
            self.linkAreaView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            self.linkAreaCenterLineView.widthAnchor.constraint(equalToConstant: 1),
            self.linkAreaCenterLineView.leadingAnchor.constraint(equalTo: self.webButton.trailingAnchor),
            self.linkAreaCenterLineView.trailingAnchor.constraint(equalTo: self.shareButton.leadingAnchor),
            self.linkAreaCenterLineView.heightAnchor.constraint(equalTo: self.linkAreaView.heightAnchor),
            self.linkAreaCenterLineView.centerYAnchor.constraint(equalTo: self.linkAreaView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.webButton.leadingAnchor.constraint(equalTo: self.linkAreaView.leadingAnchor),
            self.webButton.topAnchor.constraint(equalTo: self.linkAreaView.topAnchor),
            self.webButton.bottomAnchor.constraint(equalTo: self.linkAreaView.bottomAnchor),
            self.webButton.widthAnchor.constraint(equalTo: self.shareButton.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.shareButton.topAnchor.constraint(equalTo: self.linkAreaView.topAnchor),
            self.shareButton.bottomAnchor.constraint(equalTo: self.linkAreaView.bottomAnchor),
            self.shareButton.trailingAnchor.constraint(equalTo: self.linkAreaView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.additionalInfoAreaView.topAnchor.constraint(equalTo: self.defaultInfoView.bottomAnchor),
            self.additionalInfoAreaView.leadingAnchor.constraint(equalTo: self.defaultView.leadingAnchor),
            self.additionalInfoAreaView.trailingAnchor.constraint(equalTo: self.defaultView.trailingAnchor),
            self.additionalInfoAreaView.heightAnchor.constraint(equalToConstant: 48 * 3)
        ])
        
        NSLayoutConstraint.activate([
            self.sizeView.topAnchor.constraint(equalTo: self.additionalInfoAreaView.topAnchor),
            self.sizeView.leadingAnchor.constraint(equalTo: self.additionalInfoAreaView.leadingAnchor),
            self.sizeView.trailingAnchor.constraint(equalTo: self.additionalInfoAreaView.trailingAnchor),
            self.sizeView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            self.sizeLineView.leadingAnchor.constraint(equalTo: self.sizeView.leadingAnchor, constant: 8),
            self.sizeLineView.trailingAnchor.constraint(equalTo: self.sizeView.trailingAnchor, constant: -8),
            self.sizeLineView.topAnchor.constraint(equalTo: self.sizeView.topAnchor),
            self.sizeLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            self.sizeTitleLabel.leadingAnchor.constraint(equalTo: self.sizeLineView.leadingAnchor),
            self.sizeTitleLabel.centerYAnchor.constraint(equalTo: self.sizeView.centerYAnchor)
        ])
        self.sizeTitleLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.sizeLabel.centerYAnchor.constraint(equalTo: self.sizeTitleLabel.centerYAnchor),
            self.sizeLabel.trailingAnchor.constraint(equalTo: self.sizeView.trailingAnchor, constant: -16)
        ])
        self.sizeLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.ageView.topAnchor.constraint(equalTo: self.sizeView.bottomAnchor),
            self.ageView.leadingAnchor.constraint(equalTo: self.additionalInfoAreaView.leadingAnchor),
            self.ageView.trailingAnchor.constraint(equalTo: self.additionalInfoAreaView.trailingAnchor),
            self.ageView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            self.ageLineView.leadingAnchor.constraint(equalTo: self.ageView.leadingAnchor, constant: 8),
            self.ageLineView.trailingAnchor.constraint(equalTo: self.ageView.trailingAnchor, constant: -8),
            self.ageLineView.topAnchor.constraint(equalTo: self.ageView.topAnchor),
            self.ageLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            self.ageTitleLabel.leadingAnchor.constraint(equalTo: self.ageLineView.leadingAnchor),
            self.ageTitleLabel.centerYAnchor.constraint(equalTo: self.ageView.centerYAnchor)
        ])
        self.ageTitleLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.ageLabel.centerYAnchor.constraint(equalTo: self.ageTitleLabel.centerYAnchor),
            self.ageLabel.trailingAnchor.constraint(equalTo: self.ageView.trailingAnchor, constant: -16)
        ])
        self.ageLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.releaseNotesView.topAnchor.constraint(equalTo: self.ageView.bottomAnchor),
            self.releaseNotesView.leadingAnchor.constraint(equalTo: self.additionalInfoAreaView.leadingAnchor),
            self.releaseNotesView.trailingAnchor.constraint(equalTo: self.additionalInfoAreaView.trailingAnchor),
            self.releaseNotesView.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
            self.releaseNotesLineView.leadingAnchor.constraint(equalTo: self.releaseNotesView.leadingAnchor, constant: 8),
            self.releaseNotesLineView.trailingAnchor.constraint(equalTo: self.releaseNotesView.trailingAnchor, constant: -8),
            self.releaseNotesLineView.topAnchor.constraint(equalTo: self.releaseNotesView.topAnchor),
            self.releaseNotesLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            self.releaseNotesTitleLabel.leadingAnchor.constraint(equalTo: self.releaseNotesLineView.leadingAnchor),
            self.releaseNotesTitleLabel.centerYAnchor.constraint(equalTo: self.releaseNotesView.centerYAnchor)
        ])
        self.releaseNotesTitleLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.releaseNotesImageView.trailingAnchor.constraint(equalTo: self.releaseNotesView.trailingAnchor, constant: -16),
            self.releaseNotesImageView.centerYAnchor.constraint(equalTo: self.releaseNotesView.centerYAnchor),
            self.releaseNotesImageView.widthAnchor.constraint(equalToConstant: 8),
            self.releaseNotesImageView.heightAnchor.constraint(equalToConstant: 8)
        ])
        
        NSLayoutConstraint.activate([
            self.releaseNotesLabel.centerYAnchor.constraint(equalTo: self.releaseNotesTitleLabel.centerYAnchor),
            self.releaseNotesLabel.trailingAnchor.constraint(equalTo: self.releaseNotesImageView.leadingAnchor, constant: -16)
        ])
        self.releaseNotesLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            self.releaseNotesDescriptionLineView.leadingAnchor.constraint(equalTo: self.releaseNotesView.leadingAnchor, constant: 8),
            self.releaseNotesDescriptionLineView.trailingAnchor.constraint(equalTo: self.releaseNotesView.trailingAnchor, constant: -8),
            self.releaseNotesDescriptionLineView.bottomAnchor.constraint(equalTo: self.releaseNotesView.bottomAnchor),
            self.releaseNotesDescriptionLineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            self.releaseNotesButton.topAnchor.constraint(equalTo: self.releaseNotesView.topAnchor),
            self.releaseNotesButton.bottomAnchor.constraint(equalTo: self.releaseNotesView.bottomAnchor),
            self.releaseNotesButton.leadingAnchor.constraint(equalTo: self.releaseNotesView.leadingAnchor),
            self.releaseNotesButton.trailingAnchor.constraint(equalTo: self.releaseNotesView.trailingAnchor)
        ])
        
        self.descriptionLabelHeight = self.releaseNotesDescriptionLabel.heightAnchor.constraint(equalToConstant: 1)
        NSLayoutConstraint.activate([
            self.releaseNotesDescriptionLabel.topAnchor.constraint(equalTo: self.additionalInfoAreaView.bottomAnchor),
            self.releaseNotesDescriptionLabel.leadingAnchor.constraint(equalTo: self.additionalInfoAreaView.leadingAnchor, constant: 8),
            self.releaseNotesDescriptionLabel.trailingAnchor.constraint(equalTo: self.additionalInfoAreaView.trailingAnchor, constant: -8)
        ])
        self.releaseNotesDescriptionLabel.sizeToFit()
        self.isActiveReleaseNote(false)
        
        NSLayoutConstraint.activate([
            self.appDescriptionLabel.topAnchor.constraint(equalTo: self.releaseNotesDescriptionLabel.bottomAnchor),
            self.appDescriptionLabel.leadingAnchor.constraint(equalTo: self.additionalInfoAreaView.leadingAnchor),
            self.appDescriptionLabel.trailingAnchor.constraint(equalTo: self.additionalInfoAreaView.trailingAnchor),
            self.appDescriptionLabel.bottomAnchor.constraint(equalTo: self.defaultView.bottomAnchor)
        ])
        self.appDescriptionLabel.sizeToFit()
    }
    
    func setDelegates() {
        self.imgScrollView.delegate = self
    }
    
    func setAddTargets() {
        self.releaseNotesButton.addTarget(self, action: #selector(self.activeReleaseNoteButton(_:)), for: .touchUpInside)
    }
    
    func setGestures() {
        
    }
    
    /// 미리보기 이미지 주소 배열을 가지고 미리보기 화면을 만든다.
    /// - Parameter urlStrings: 주소 문자 배열
    func setImage(urlStrings: [String]?) {
        guard let urls = urlStrings else {
            return
        }
        // 이미지 비율이 4:7, 간단하게 2배로 함.
        let imgViewSize = CGSize(width: self.contentView.frame.width * 0.5,
                                 height: self.contentView.frame.width)
        print("imgView Size:::", imgViewSize)
        self.imgScrollView.contentSize = CGSize(width: (5 + imgViewSize.width) * CGFloat(urls.count) + 5,
                                                height: imgViewSize.height)
        for i in 0..<urls.count {
            if let image = CommonFunctions.shared.getImageByURL(urlString: urls[i]) {
                let imgView = UIImageView()
                imgView.image = image
                imgView.contentMode = .scaleAspectFit
                let xPosition = (5 + imgViewSize.width) * CGFloat(i) + 5
                
                imgView.frame = CGRect(x: xPosition,
                                       y: 0,
                                       width: imgViewSize.width,
                                       height: imgViewSize.height)
                
                self.imgScrollView.addSubview(imgView)
            }
        }
        
    }
    
    /// 앱 정보를 가지고 elements들을 설정한다.
    /// - Parameter info: 앱 정보
    func setDetailInfo(_ info: AppInfo) {
        self.setImage(urlStrings: info.screenshotUrls)
        self.appNameLabel.text = info.trackName
        self.sellerLabel.text = info.sellerName
        self.sizeLabel.text = CommonFunctions.shared.convertByteToMB(info.fileSizeBytes) ?? "0" + "MB"
        self.ageLabel.text = info.contentAdvisoryRating
        self.releaseNotesLabel.text = info.version
        self.releaseNotesDescriptionLabel.text = info.releaseNotes
        self.appDescriptionLabel.text = info.description
        if var price = info.formattedPrice,
            price != "무료" {
            price.removeFirst()
            let titleString = NSAttributedString(string: price, attributes: [.font : UIFont.systemFont(ofSize: 20, weight: .bold)])
            let bodyString = NSAttributedString(string: "원", attributes: [.font : UIFont.systemFont(ofSize: 12)])
            let attrString = NSMutableAttributedString()
            attrString.append(titleString)
            attrString.append(bodyString)
            self.priceLabel.attributedText = attrString
        } else {
            self.priceLabel.text = info.formattedPrice
        }
    }
}

// MARK: - 
extension DetailTableViewCell {
    /// 새로운 기능에 대한 공지를 보여주는지 여부
    /// - Parameter active: true: 새로운 기능 보여줌, false: 새로운 기능 닫음
    func isActiveReleaseNote(_ active: Bool) {
        if active {
            self.releaseNotesImageView.image = UIImage(named: "UpArrow")
            if let labelHeight = self.descriptionLabelHeight {
                self.releaseNotesDescriptionLabel.isHidden = false
                NSLayoutConstraint.deactivate([labelHeight])
            }
        } else {
            self.releaseNotesImageView.image = UIImage(named: "DownArrow")
            if let labelHeight = self.descriptionLabelHeight {
                self.releaseNotesDescriptionLabel.isHidden = true
                NSLayoutConstraint.activate([labelHeight])
            }
        }
        self.layoutIfNeeded()
    }
}

// MARK: - 버튼 기능
extension DetailTableViewCell {
    @objc func activeReleaseNoteButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.isActiveReleaseNote(sender.isSelected)
    }
}

extension DetailTableViewCell: UIScrollViewDelegate {
    
}
