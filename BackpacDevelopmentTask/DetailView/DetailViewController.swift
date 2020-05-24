//
//  DetailViewController.swift
//  BackpacDevelopmentTask
//
//  Created by Hansub Yoo on 2020/05/24.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var appInfo: AppInfo?
    
    var detailTableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DetailTableViewCell.self, forCellReuseIdentifier: "detailCell")
        tableView.register(GenrTableViewCell.self, forCellReuseIdentifier: "genrCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
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
        
        NSLayoutConstraint.activate([
            self.detailTableView.topAnchor.constraint(equalTo: safeAreaTopAnchor),
            self.detailTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.detailTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.detailTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
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

extension DetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.frame.height
        } else {
            return 200
        }
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailTableViewCell
            cell.setDetailInfo(self.appInfo!)
            return cell
        } else { // row is 1
            let cell = tableView.dequeueReusableCell(withIdentifier: "genrCell", for: indexPath) as! GenrTableViewCell
            cell.setGenr(genrs: self.appInfo?.genres)
            return cell
        }
    }
}
