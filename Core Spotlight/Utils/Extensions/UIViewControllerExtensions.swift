//
//  UIViewControllerExtensions.swift
//  Quick Cash
//
//  Created by Pranav Badgi on 4/22/22.
//

import UIKit

extension UIViewController {
    
    ///This function configures the gradient background to any view controller
    func configureGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0, 1]
        view.layer.addSublayer(gradientLayer)
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = view.frame
    }
    
    func setupVC(bgColor: UIColor) {
        view.backgroundColor = bgColor
        navigationController?.navigationBar.isHidden = true
    }
    
    func generateFeedback() {
        let impactFeedbackgenerator = UIImpactFeedbackGenerator(style: .medium)
        impactFeedbackgenerator.prepare()
        impactFeedbackgenerator.impactOccurred()
    }
    
    func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func showToast(message : String, font: UIFont, toastColor: UIColor,
                   toastBackground: UIColor) {
        let toastLabel = UILabel()
        toastLabel.textColor = toastColor
        toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 0.0
        toastLabel.layer.cornerRadius = 6
        toastLabel.backgroundColor = toastBackground
        
        toastLabel.clipsToBounds  =  true
        
        let toastWidth: CGFloat = toastLabel.intrinsicContentSize.width + 16
        let toastHeight: CGFloat = 32
        
        toastLabel.frame = CGRect(x: self.view.frame.width / 2 - (toastWidth / 2),
                                  y: self.view.frame.height - (toastHeight * 3),
                                  width: toastWidth, height: toastHeight)
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 1.5, delay: 0.25, options: .autoreverse, animations: {
            toastLabel.alpha = 1.0
        }) { _ in
            toastLabel.removeFromSuperview()
        }
    }
    
    
    func setAttributedText(to label: UILabel, attributedTextOne: String, attributedTextTwo: String, textOneFont: UIFont, textTwoFont: UIFont, textOneColor: UIColor, textTwoColor: UIColor) {
        
        let attributedText = NSMutableAttributedString(string: "\(attributedTextOne)",
                                                       attributes: [NSAttributedString.Key.font: textOneFont,
                                                                    NSAttributedString.Key.foregroundColor: textOneColor])
        attributedText.append(NSAttributedString(string: "  \(attributedTextTwo)",
                                                 attributes: [NSAttributedString.Key.font: textTwoFont,
                                                              NSAttributedString.Key.foregroundColor: textTwoColor]))
        label.attributedText = attributedText
    }
    
    

    func setSingleLineAttributedText(to label: UILabel, attributedTextOne: String, attributedTextTwo: String, textOneFont: UIFont, textTwoFont: UIFont, textOneColor: UIColor, textTwoColor: UIColor) {
        
        let attributedText = NSMutableAttributedString(string: "\(attributedTextOne) ",
                                                       attributes: [NSAttributedString.Key.font: textOneFont,
                                                                    NSAttributedString.Key.foregroundColor: textOneColor])
        attributedText.append(NSAttributedString(string: "\(attributedTextTwo)",
                                                 attributes: [NSAttributedString.Key.font: textTwoFont,
                                                              NSAttributedString.Key.foregroundColor: textTwoColor]))
        label.attributedText = attributedText
    }
    
    
    func hideNavigationBar(animated: Bool){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    func showNavigationBar(animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    
    func styleNavBar(isLargeTitle: Bool, textColor: UIColor, forTitle: String) {
        let textAttributes = [NSAttributedString.Key.foregroundColor: textColor]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
        if isLargeTitle {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
        self.navigationItem.title = forTitle
    }
    
    
    func addViewOnTopOfAllViews(view: UIView) {
        let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        window!.addSubview(view)
    }
    
    
}



















