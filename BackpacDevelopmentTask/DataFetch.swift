//
//  DataFetch.swift
//  BackpacDevelopmentTask
//
//  Created by Hansub Yoo on 2020/05/26.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import Foundation
import Alamofire

class DataFetch {
    static let shared = DataFetch()
}

extension DataFetch {
    /// api에서 데이터를 읽어들인다.
    func getData(_ success: ((ItunesAppInfo) -> Void)? = nil ) {
        // MARK: 잘못된 주소 TestURL
//        let urlStr = "가나다라마바사"
//        let urlStr = "www.naver.com"
        let urlStr = "https://itunes.apple.com/search?term=" + CommonValue.wordToSearch + "&country=kr&media=software"
        
        if let encoded  = urlStr.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let myURL = URL(string: encoded) {
            AF.request(myURL)
                .responseData { response in
                    switch response.result {
                    case .success:
                        do {
                            let decoder = JSONDecoder()
                            if let data = response.data {
                                let decodedData = try decoder.decode(ItunesAppInfo.self, from: data)
                                
                                success?(decodedData)
                                
                            } else {
                                print("No Data")
                            }
                        } catch let error {
                            print("Do Catch Error:::", error.localizedDescription)
                        }
                    case let .failure(error):
                        print("Failure Error:::", error.localizedDescription)
                    }
            }
        } else {
            CommonFunctions.shared.showAlert(controller: CommonFunctions.shared.getTopVC(UIApplication.shared.keyWindow?.rootViewController),
                                             title: "잘못된 URL", message: "잘못된 URL을 입력하였습니다.",
                                             alertStyle: .alert)
        }
    }
}
