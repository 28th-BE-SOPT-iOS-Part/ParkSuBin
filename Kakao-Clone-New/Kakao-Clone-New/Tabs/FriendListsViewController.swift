//
//  FriendListsViewController.swift
//  Kakao-Clone-New
//
//  Created by Subeen Park on 2021/05/12.
//

import UIKit
import SnapKit
import Then

class FriendListsViewController: UIViewController {
    
    
    let titleLabel = UILabel().then {
        $0.text = "친구"
        $0.font = .systemFont(ofSize: 28, weight: .semibold)
        $0.textColor = .black
    }
    
    let friendImageView = UIImageView(image: UIImage(named: "profileUserImg")).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // add elements
        self.view.addSubview(titleLabel)
        self.view.addSubview(friendImageView)
        
        // layout
        self.titleLabelLayout()
        self.friendImageViewLayout()
        
        // add tap gesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onFriendImageTapped))
        friendImageView.addGestureRecognizer(tapGesture)
        friendImageView.isUserInteractionEnabled = true
       
    }
    
    
    func titleLabelLayout() {
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    func friendImageViewLayout() {
        self.friendImageView.snp.makeConstraints {
            $0.top.equalTo(self.titleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(self.titleLabel.snp.leading)
            $0.width.equalTo(60)
            $0.height.equalTo(60)
        }
    }
    
    @objc func onFriendImageTapped() {
        let modalView = FriendListsModalViewController()
        modalView.modalPresentationStyle = .fullScreen
        self.present(modalView, animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
