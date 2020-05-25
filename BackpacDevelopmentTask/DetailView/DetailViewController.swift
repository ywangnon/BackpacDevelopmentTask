//
//  DetailViewController.swift
//  BackpacDevelopmentTask
//
//  Created by Hansub Yoo on 2020/05/24.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit
import StoreKit

class DetailViewController: UIViewController {
    var appInfo: AppInfo?
    
    var detailTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        //        tableView.numberOfSections = 2
        tableView.bounces = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "detailCell")
        tableView.register(GenrTableViewCell.self, forCellReuseIdentifier: "genrCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var tableBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setViewFoundations()
        self.setAddSubViews()
        self.setLayouts()
        self.setDelegates()
        self.setAddTargets()
        self.setGestures()
    }
    
    func setViewFoundations() {
        self.view.backgroundColor = .darkGray
        
        if #available(iOS 11.0, *) {
            self.navigationItem.largeTitleDisplayMode = .never
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setAddSubViews() {
        self.view.addSubviews([
            self.detailTableView
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
        
        self.tableBottomConstraint = self.detailTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        NSLayoutConstraint.activate([
            self.detailTableView.topAnchor.constraint(equalTo: safeAreaTopAnchor),
            self.detailTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.detailTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.tableBottomConstraint
        ])
    }
    
    func setDelegates() {
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
    }
    
    func setAddTargets() {
        
    }
    
    func setGestures() {
        
    }
}

// MARK: - 버튼 액션
extension DetailViewController {
    @objc func webButton(_ sender: UIButton) {
        if let url = self.appInfo?.trackViewURL,
            let appStoreURL = URL(string: url),
            UIApplication.shared.canOpenURL(appStoreURL) {
            UIApplication.shared.open(appStoreURL, options: [:], completionHandler: nil)
        }
    }
    
    @objc func shareButton(_ sender: UIButton) {
        guard let url = self.appInfo?.trackViewURL else { return }
        let activityVC = UIActivityViewController(activityItems: [url],
                                                  applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
}

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 1.0 : 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return self.view.frame.height
        } else {
            return 48
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell
            cell.setDetailInfo(self.appInfo!)
            cell.webButton.addTarget(self, action: #selector(self.webButton(_:)), for: .touchUpInside)
            cell.shareButton.addTarget(self, action: #selector(self.shareButton(_:)), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "genrCell", for: indexPath) as! GenrTableViewCell
            cell.setGenr(genrs: self.appInfo?.genres)
            return cell
        }
    }
}
