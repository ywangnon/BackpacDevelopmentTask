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
    let searchedWord: String = "핸드메이드"
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
        // Do any additional setup after loading the view.
        
        self.getData()
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setDelegates()
        self.setAddTargets()
        self.setGestures()
        self.setOtherProperties()
    }
    
    func setViewFoundations() {
        self.title = self.searchedWord
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
//            let label = UILabel()
//            label.text = "핸드메이드"
//            label.sizeToFit()
//            label.font = .systemFont(ofSize: 20, weight: .bold)
//            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: label)
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
            // Fallback on earlier versions
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
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
    
    func setOtherProperties() {
        self.mainTableView.separatorStyle = .none
    }
}

// MARK: - 통신 관련 함수
extension MainViewController {
    /// api에서 데이터를 읽어들인다.
    func getData() {
        let urlStr = "https://itunes.apple.com/search?term=" + self.searchedWord + "&country=kr&media=software"
        
        if let encoded  = urlStr.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let myURL = URL(string: encoded){
            AF.request(myURL)
                .validate(statusCode: 200..<300)
                .responseData { response in
                    switch response.result {
                    case .success:
                        do {
                            let decoder = JSONDecoder()
                            if let data = response.data {
                                let decodedData = try decoder.decode(ItunesAppInfo.self, from: data)
                                self.searchedData = decodedData
                                
                                DispatchQueue.main.async {
                                    self.mainTableView.reloadData()
                                }
                            } else {
                                print("No Data")
                            }
                        } catch let error {
                            print("Error:::", error.localizedDescription)
                        }
                    case let .failure(error):
                        print(error)
                    }
            }
        }
    }
}

// MARK: -
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.frame.width * 1.3
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
        mainCell.ratingView.rating = self.searchedData?.results![indexPath.row].averageUserRating as! Double
        return mainCell
    }
}
