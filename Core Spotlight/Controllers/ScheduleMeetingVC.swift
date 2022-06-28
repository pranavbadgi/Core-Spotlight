//
//  ScheduleMeetingVC.swift
//  Core Spotlight
//
//  Created by Pranav Badgi on 6/27/22.
//

import UIKit

protocol ScheduleMeetingVCDelegate: AnyObject {
    func meetingCreatedSuccessfully()
}

final class ScheduleMeetingVC: UIViewController {
    
    //MARK: - Properties
    
    weak var delegate: ScheduleMeetingVCDelegate?
        
    private let meetingNameTextField = CustomTextField(placeholder: "Meeting Name",
                                                       placeholderColor: .secondaryLabel,
                                                       tfHeight: 35,
                                                       textcolor: .label,
                                                       textFont: UIFont.systemFont(ofSize: 14, weight: .semibold),
                                                       isSecure: false,
                                                       keyboardtype: .default,
                                                       radius: 35/2,
                                                       bordercolor: .clear,
                                                       borderwidth: 0,
                                                       is_Hidden: false,
                                                       backgroundcolor: .secondarySystemBackground,
                                                       alphaValue: 1)
    
    
    private let hostedByTextField = CustomTextField(placeholder: "Hosted By",
                                                    placeholderColor: .secondaryLabel,
                                                    tfHeight: 35,
                                                    textcolor: .label,
                                                    textFont: UIFont.systemFont(ofSize: 14, weight: .semibold),
                                                    isSecure: false,
                                                    keyboardtype: .default,
                                                    radius: 35/2,
                                                    bordercolor: .clear,
                                                    borderwidth: 0,
                                                    is_Hidden: false,
                                                    backgroundcolor: .secondarySystemBackground,
                                                    alphaValue: 1)
    
    
    private let dateTextField = CustomTextField(placeholder: "Date & Time",
                                                placeholderColor: .secondaryLabel,
                                                tfHeight: 35,
                                                textcolor: .label,
                                                textFont: UIFont.systemFont(ofSize: 14, weight: .semibold),
                                                isSecure: false,
                                                keyboardtype: .default,
                                                radius: 35/2,
                                                bordercolor: .clear,
                                                borderwidth: 0,
                                                is_Hidden: false,
                                                backgroundcolor: .secondarySystemBackground,
                                                alphaValue: 1)
    
        
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 16
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        return sv
    }()
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    
    
    
    
    
    
    //MARK: - Layout Sub Views
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureViews()
        setupNavBar()
    }
    
    
    
    
    
    
    
    
    
    //MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .systemBackground
        setupTapGesture()
    }
    
    
    
    
    
    
    private func configureViews() {
        //  add subviews
        view.addSubview(stackView)
        stackView.addArrangedSubview(meetingNameTextField)
        stackView.addArrangedSubview(hostedByTextField)
        stackView.addArrangedSubview(dateTextField)

        
        //  layout views
        stackView.centerY(inView: view)
        stackView.anchor(left: view.leftAnchor,
                         right: view.rightAnchor,
                         paddingLeft: 32,
                         paddingRight: 32)
    }
    
    
    
    
    
    
    
    private func setupNavBar() {
        title = "Schedule Meeting"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(addButtonTapped))
    }
    
    
    
    
    
    
    
    
    
    private func validateTextFields() {
        guard let meetingName = meetingNameTextField.text,
              let hostedBy = hostedByTextField.text,
              let dateAndTime = dateTextField.text,
              !meetingName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !hostedBy.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
              !dateAndTime.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            print("DEBUG: Some of the Fields are empty")
            return
        }
        print("DEBUG: Scheduling a meeting...")
        let meeting = Meeting(meetingName: meetingName, hostedBy: hostedBy, dateAndTime: dateAndTime)
        CoreDataHelpers.shared.createMeeting(meeting: meeting, completion: { [weak self] done in
            if done {
                self?.delegate?.meetingCreatedSuccessfully()
                self?.navigationController?.popViewController(animated: true)
            }
        })
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Selectors
    
    
    @objc private func addButtonTapped() {
        validateTextFields()
    }
    
    

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


//MARK: - Extensions















