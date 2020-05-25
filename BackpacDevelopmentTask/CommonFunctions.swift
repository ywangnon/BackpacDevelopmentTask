//
//  CommonFunctions.swift
//  BackpacDevelopmentTask
//
//  Created by Hansub Yoo on 2020/05/23.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit

class CommonFunctions {
    static let shared = CommonFunctions()
}

extension CommonFunctions {
    /// 입력된 url의 이미지를 가져온다.
    func getImageByURL(urlString: String?) -> UIImage? {
        if let urlString = urlString,
            let url = URL(string: urlString),
            let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        } else {
            return nil
        }
    }
    
    func convertByteToMB(_ byteSize: String?) -> String? {
        if let byte = byteSize,
            let intByte = Int(byte) {
            let mb = intByte / 1000000
            return "\(mb)"
        } else {
            return nil
        }
    }
    
    func checkHomeIndicator() -> Bool {
        if #available(iOS 11.0, *) {
            return UIWindow().safeAreaInsets.bottom == 34
        } else {
            return false
        }
    }
}
