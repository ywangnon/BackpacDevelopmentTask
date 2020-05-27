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
        }
        return nil
    }
    
    /// byte 크기를 MB 크기로 바꿔준다.
    /// 실제는 1,048,576 bytes == 1mb 이지만, 백만으로 계산
    func convertByteToMB(_ byteSize: String?) -> String? {
        if let byte = byteSize,
            let intByte = Int(byte) {
            let mb = intByte / 1_000_000
            return "\(mb)"
        }
        return nil
    }
    
    /// 숫자를 반올림 해준다.
    func roundingNumber(_ number: Double?) -> Double {
        if let number = number {
            return round(number * 10) / 10
        }
        return 0.0
    }
    
    // MARK: 최상위 뷰를 얻는다.
    func getTopVC(_ windowRootVC: UIViewController?) -> UIViewController? {
        var topVC = windowRootVC
        while true {
            if let top = topVC?.presentedViewController {
                topVC = top
                
            } else if let base = topVC as? UINavigationController, let top = base.visibleViewController {
                topVC = top
                
            } else if let base = topVC as? UITabBarController, let top = base.selectedViewController {
                topVC = top
                
            } else {
                break
            }
        }
        
        return topVC
    }
    
    /// 기본적인 경고창을 생성한다.
    func showAlert(controller: UIViewController?, title: String, message : String, alertStyle: UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: alertStyle)
        let alertAction = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        controller?.present(alert, animated: true)
    }
}
