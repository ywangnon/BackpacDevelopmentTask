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
    func getImageByURL(urlString: String?) -> UIImage? {
        if let urlString = urlString,
            let url = URL(string: urlString),
            let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        } else {
            return nil
        }
    }
}
