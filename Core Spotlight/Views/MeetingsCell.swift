//
//  MeetingsCell.swift
//  Core Spotlight
//
//  Created by Pranav Badgi on 6/27/22.
//

import UIKit

final class MeetingsCell: UICollectionViewCell {

    
    
    //MARK: - Properties
    static let identifier = "MeetingsCell"
    
    private let meetingIconContainer: UIView = {
        let view                    = UIView()
        view.layer.cornerRadius     = 12
        view.clipsToBounds          = true
        view.backgroundColor        = .systemPurple
        view.layer.masksToBounds    = true
        return view
    }()
    
    
    private let meetingIconImageView: UIImageView = {
        let iv              = UIImageView()
        iv.contentMode      = .scaleAspectFit
        iv.clipsToBounds    = true
        iv.tintColor        = .white
        iv.image = UIImage(systemName: SFSymbol.briefcase.rawValue)
        return iv
    }()
    
    
    
    private let meetingDateAndTimeLabel = CustomLabel(fontName: UIFont.systemFont(ofSize: 14, weight: .semibold),
                                                      title: "Date & Time",
                                                      alignment: .center,
                                                      titleColor: .label,
                                                      lines: 0,
                                                      isInteractionEnabled: true,
                                                      withInsets: 0, 0, 0, 0)
    
    
    private let meetingTitleAndHostedByLabel = CustomLabel(fontName: UIFont.systemFont(ofSize: 14, weight: .semibold),
                                                           title: "Title & Hosted By",
                                                           alignment: .left,
                                                           titleColor: .label,
                                                           lines: 0,
                                                           isInteractionEnabled: true,
                                                           withInsets: 0, 0, 0, 0)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        //  attributes
        backgroundColor     = .secondarySystemBackground
        clipsToBounds       = true
        layer.cornerRadius  = 24
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    
    //MARK: - Layout Subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        configureViews()
    }
    
    
    
    
    
    //MARK: - Helpers
    private func configureViews() {
        //  add subviews
        addSubview(meetingIconContainer)
        addSubview(meetingIconImageView)
        addSubview(meetingDateAndTimeLabel)
        addSubview(meetingTitleAndHostedByLabel)
        
        
        //  layout views
        
        //  meeting icon container
        let iconContainerSize = self.frame.size.height/1.5
        meetingIconContainer.setDimensions(height: iconContainerSize, width: iconContainerSize)
        meetingIconContainer.centerY(inView: self)
        meetingIconContainer.anchor(left: leftAnchor,
                                    paddingLeft: 16)
        
        
        
        //  meeting icon imageview
        meetingIconImageView.setDimensions(height: iconContainerSize/1.5, width: iconContainerSize/1.5)
        meetingIconImageView.centerY(inView: meetingIconContainer)
        meetingIconImageView.centerX(inView: meetingIconContainer)
        
        
        //  meeting date and time label
        meetingDateAndTimeLabel.centerY(inView: meetingIconContainer)
        meetingDateAndTimeLabel.anchor(right: rightAnchor,
                                       paddingRight: 16)
        

        
        
        //  meeting title and hosted by label
        meetingTitleAndHostedByLabel.anchor(top: topAnchor,
                                            left: meetingIconContainer.rightAnchor,
                                            bottom: bottomAnchor,
                                            right: meetingDateAndTimeLabel.leftAnchor,
                                            paddingTop: 10,
                                            paddingLeft: 10,
                                            paddingBottom: 10,
                                            paddingRight: 10)
        

        
    }
    
    
    
    
    
    
    
    
    //MARK: - Configure With Model
    func configure(withModel model: MeetingItem) {
        guard let meetingName = model.meetingName,
              let hostedBy = model.hostedBy,
              let dateAndTime = model.dateAndTime else { return }
        
        let date = dateAndTime.components(separatedBy: " ")[0]
        let time = dateAndTime.components(separatedBy: " ")[1]
        
        setTwoLineAttributedText(to: meetingDateAndTimeLabel,
                                 attributedTextOne: date,
                                 attributedTextTwo: "@ \(time)",
                                 textOneFont: UIFont.systemFont(ofSize: 10, weight: .semibold),
                                 textTwoFont: UIFont.systemFont(ofSize: 12, weight: .bold),
                                 textOneColor: .label,
                                 textTwoColor: .label)
        
        setTwoLineAttributedText(to: meetingTitleAndHostedByLabel,
                                 attributedTextOne: meetingName,
                                 attributedTextTwo: "hosted by: \(hostedBy)",
                                 textOneFont: UIFont.systemFont(ofSize: 15, weight: .bold),
                                 textTwoFont: UIFont.systemFont(ofSize: 12, weight: .regular),
                                 textOneColor: .label,
                                 textTwoColor: .label)
    }
    
    
    
    
    
    
}







