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
        let urlStr = "https://itunes.apple.com/search?term=핸드메이드&country=kr&media=software"
        
        if let encoded  = urlStr.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed),
            let myURL = URL(string: encoded) {
            AF.request(myURL)
                .validate(statusCode: 200..<300)
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
                            print("Error:::", error.localizedDescription)
                        }
                    case let .failure(error):
                        print("Error:::", error.localizedDescription)
                    }
            }
        }
    }
}
