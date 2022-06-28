//
//  MeetingsListVC.swift
//  Core Spotlight
//
//  Created by Pranav Badgi on 6/27/22.
//

import UIKit

final class MeetingsListVC: UIViewController {
    
    //MARK: - Properties
    
    private let collectionView: UICollectionView = {
        let layout                      = UICollectionViewFlowLayout()
        let cv                          = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor              = .clear
        cv.showsVerticalScrollIndicator = false
        cv.register(MeetingsCell.self, forCellWithReuseIdentifier: MeetingsCell.identifier)
        return cv
    }()
    
    private var model: [MeetingItem] = []
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addDelegates()
        getAllMeetings()
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
        view.addSubview(collectionView)
        
        //  layout views
        collectionView.frame = view.frame
    }
    
    
    
    
    
    
    
    
    
    private func setupNavBar() {
        title = "Meetings"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: SFSymbol.plus.rawValue)!,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(scheduleMeetingTapped))
    }
    
    
    
    
    
    private func addDelegates() {
        collectionView.delegate     = self
        collectionView.dataSource   = self
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: - Selectors
    
    @objc private func scheduleMeetingTapped() {
        print("DEBUG: Schedule Meeting Tapped")
        let vc = ScheduleMeetingVC()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
    
    
    


}


//MARK: - Extensions

//MARK: - CollectionView
extension MeetingsListVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let meetingModel = model[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MeetingsCell.identifier, for: indexPath) as! MeetingsCell
        cell.configure(withModel: meetingModel)
        return cell
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meetingModel = model[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        //  show sheet
        showOptionSheet(collectionView: collectionView, indexPath: indexPath, meetingModel: meetingModel)
    }
    
}




//MARK: - CollectionView Flow Layout
extension MeetingsListVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width   = view.frame.width - 32
        let height  = view.frame.width/5
        return CGSize(width: width, height: height)
    }
    
}









//MARK: - Core Data
extension MeetingsListVC: ScheduleMeetingVCDelegate {
    
    
    func meetingCreatedSuccessfully() {
        getAllMeetings()
    }
    
    
    
    
    
    //  Gets All Meetings from Core Data
    private func getAllMeetings() {
        DispatchQueue.main.async {
            self.model = CoreDataHelpers.shared.getAllMeetings()
            self.collectionView.reloadData()
        }
    }
    
    
    
    
    
    
    private func showOptionSheet(collectionView: UICollectionView, indexPath: IndexPath, meetingModel: MeetingItem) {
        let sheet = UIAlertController(title: "Options", message: nil, preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            CoreDataHelpers.shared.deleteMeeting(meeting: meetingModel, completion: { [weak self] done in
                if done {
                    self?.getAllMeetings()
                }
            })
        }))
        present(sheet, animated: true)
    }
    
    
}
