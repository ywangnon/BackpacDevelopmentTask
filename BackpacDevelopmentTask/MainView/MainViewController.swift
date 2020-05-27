//
//  ViewController.swift
//  BackpacDevelopmentTask
//
//  Created by Hansub Yoo on 2020/05/23.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
    /// 검색된 데이터
    var searchedData: ItunesAppInfo?
    
    var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "mainCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global(qos: .background).async {
            DataFetch.shared.getData { (appInfo) in
                self.searchedData = appInfo
                DispatchQueue.main.async {
                    self.mainTableView.reloadData()
                }
                self.checkNoData(self.searchedData?.resultCount)
            }
        }
        
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setDelegates()
        self.setOtherProperties()
    }
    
    func setViewFoundations() {
        self.title = CommonValue.wordToSearch
        
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    func setAddSubViews() {
        self.view.addSubviews([
            self.mainTableView
        ])
    }
    
    func setLayouts() {
        var safeAreaTopAnchor: NSLayoutYAxisAnchor
        if #available(iOS 11.0, *) {
            safeAreaTopAnchor = self.view.safeAreaLayoutGuide.topAnchor
        } else {
            safeAreaTopAnchor = self.view.topAnchor
        }
        
        NSLayoutConstraint.activate([
            self.mainTableView.topAnchor.constraint(equalTo: safeAreaTopAnchor),
            self.mainTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.mainTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.mainTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func setDelegates() {
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
    }
    
    func setOtherProperties() {
        self.mainTableView.separatorStyle = .none
    }
}

// MARK: - 기능
extension MainViewController {
    /// 데이터가 없을 경우 alert을 띄워준다.
    func checkNoData(_ count: Int?) {
        if let count = count,
            count == 0 {
            CommonFunctions.shared.showAlert(controller: self,
                                             title: "", message: "찾으시는 데이터가 없습니다.",
                                             alertStyle: .alert)
        }
    }
}

// MARK: -
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width * 1.33
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.mainTableView.deselectRow(at: indexPath, animated: false)
        let detailVC = DetailViewController()
        detailVC.appInfo = self.searchedData?.results![indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchedData?.resultCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mainCell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainTableViewCell
        mainCell.titleImageView.image = CommonFunctions.shared.getImageByURL(urlString: self.searchedData?.results![indexPath.row].artworkUrl512)
        mainCell.appNameLabel.text = self.searchedData?.results![indexPath.row].trackName
        mainCell.sellerNameLabel.text = self.searchedData?.results![indexPath.row].sellerName
        mainCell.genrelabel.text = self.searchedData?.results![indexPath.row].primaryGenreName
        mainCell.priceLabel.text = self.searchedData?.results![indexPath.row].formattedPrice
        mainCell.ratingView.rating = CommonFunctions.shared.roundingNumber(self.searchedData?.results![indexPath.row].averageUserRating)
        return mainCell
    }
}
