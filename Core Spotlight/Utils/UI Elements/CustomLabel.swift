//
//  CustomLabel.swift
//  ImportantProjectStuffs
//
//  Created by Pranav Badgi on 11/22/21.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    
    var topInset: CGFloat
    var bottomInset: CGFloat
    var leftInset: CGFloat
    var rightInset: CGFloat
    
    
    //MARK: - Init
    init(fontName: UIFont,
         title: String,
         alignment: NSTextAlignment,
         titleColor: UIColor,
         lines: Int,
         isInteractionEnabled: Bool, withInsets top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat) {
        self.topInset = top
        self.bottomInset = bottom
        self.leftInset = left
        self.rightInset = right
        super.init(frame: .zero)
        //set Attributes
        font                    = fontName
        text                    = title
        textAlignment           = alignment
        textColor               = titleColor
        numberOfLines           = lines
        isUserInteractionEnabled = isInteractionEnabled
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
    
}
