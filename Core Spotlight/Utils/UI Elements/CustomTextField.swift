//
//  CustomTextField.swift
//  ImportantProjectStuffs
//
//  Created by Pranav Badgi on 11/22/21.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
//MARK: - Init
    init(placeholder: String,
         placeholderColor: UIColor,
         tfHeight: CGFloat,
         textcolor: UIColor,
         textFont: UIFont,
         isSecure: Bool,
         keyboardtype: UIKeyboardType,
         radius: CGFloat,
         bordercolor: UIColor,
         borderwidth: CGFloat,
         is_Hidden: Bool,
         backgroundcolor: UIColor,
         alphaValue: CGFloat) {
        
        super.init(frame: .zero)
        
        //set Attributes
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: placeholderColor])
        let spacer = UIView()
        spacer.setDimensions(height: tfHeight, width: 12)
        leftView = spacer
        leftViewMode = .always
        
        let rightSpacer = UIView()
        rightSpacer.setDimensions(height: tfHeight, width: 12)
        rightView = rightSpacer
        rightViewMode = .always
        
        setHeight(height: tfHeight)
        textColor = textcolor
        font = textFont
        isSecureTextEntry = isSecure
        keyboardType = keyboardtype
        layer.cornerRadius = radius
        layer.borderColor = bordercolor.cgColor
        layer.borderWidth = borderwidth
        backgroundColor = backgroundcolor
        isHidden = is_Hidden
        alpha = alpha
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

