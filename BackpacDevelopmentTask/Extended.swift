//
//  Extended.swift
//  BackpacDevelopmentTask
//
//  Created by Hansub Yoo on 2020/05/23.
//  Copyright © 2020 Hansub Yoo. All rights reserved.
//

import UIKit

extension UIView {
    /// 여러 뷰들을 addSubview 시킵니다.
    ///
    /// - Parameter views: 뷰 배열
    open func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    /// 여러 레이아웃가이드를 add시킵니다.
    /// - Parameter guides: 레이아웃가이드 배열
    open func addaddLayoutGuides(_ guides: [UILayoutGuide]) {
        for guide in guides {
            self.addLayoutGuide(guide)
        }
    }
}
