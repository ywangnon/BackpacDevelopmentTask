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

@IBDesignable
class PaddedLabel: UILabel {

    @IBInspectable var inset:CGSize = CGSize(width: 0, height: 0)

    var padding: UIEdgeInsets {
        var hasText:Bool = false
        if let t = self.text?.count, t > 0 {
            hasText = true
        }
        else if let t = attributedText?.length, t > 0 {
            hasText = true
        }

        return hasText ? UIEdgeInsets(top: inset.height, left: inset.width, bottom: inset.height, right: inset.width) : UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }

    override var intrinsicContentSize: CGSize {
        let superContentSize = super.intrinsicContentSize
        let p = padding
        let width = superContentSize.width + p.left + p.right
        let heigth = superContentSize.height + p.top + p.bottom
        return CGSize(width: width, height: heigth)
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let superSizeThatFits = super.sizeThatFits(size)
        let p = padding
        let width = superSizeThatFits.width + p.left + p.right
        let heigth = superSizeThatFits.height + p.top + p.bottom
        return CGSize(width: width, height: heigth)
    }
}
