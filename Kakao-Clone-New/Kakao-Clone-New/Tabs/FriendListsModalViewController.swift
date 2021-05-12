//
//  FriendListsModalViewController.swift
//  Kakao-Clone-New
//
//  Created by Subeen Park on 2021/05/12.
//

import UIKit
import SnapKit
import Then

class FriendListsModalViewController: UIViewController {
    
    let profileImageView = UIImageView(image: UIImage(named: "profileUserImg")).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let profileNameLabel = UILabel().then {
        $0.text = "김솝트"
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.textAlignment = .center
        $0.textColor = .white
    }
    
    let horizontalBar = UIView().then {
        $0.backgroundColor = UIColor(red: 159.0 / 255.0, green: 167.0 / 255.0, blue: 173.0 / 255.0, alpha: 1.0)
    }
    
    let toolItem1 = UIView().then {
        $0.tintColor = .black
    }
    let toolItem2 = UIView().then {
        $0.tintColor = .black
    }
    let toolItem3 = UIView().then {
        $0.tintColor = .black
    }
    
    let imageView1 = UIImageView().then {
        $0.image = UIImage(named: "profileTalkImg")?.withRenderingMode(.alwaysOriginal)
        $0.snp.makeConstraints {
            $0.width.equalTo(18.9)
            $0.height.equalTo(17.6)
        }
    }
    let imageView2 = UIImageView().then {
        $0.image = UIImage(named: "profileEditImg")?.withRenderingMode(.alwaysOriginal)
        $0.snp.makeConstraints {
            $0.width.equalTo(17.7)
            $0.height.equalTo(19.3)
        }
    }
    let imageView3 = UIImageView().then {
        $0.image = UIImage(named: "profileStoryImg")?.withRenderingMode(.alwaysOriginal)
        $0.snp.makeConstraints {
            $0.width.equalTo(18.6)
            $0.height.equalTo(21.6)
        }
    }
    
    let label1 = UILabel().then {
        $0.text = "나와의 채팅"
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    let label2 = UILabel().then {
        $0.text = "프로필 편집"
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    let label3 = UILabel().then {
        $0.text = "카카오스토리"
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    

    
    let toolStack = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }
    
    
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
       }

    
    let closeButton = UIButton().then {
        $0.setBackgroundImage(UIImage(named: "profileCloseBtn")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 135.0 / 255.0, green: 145.0 / 255.0, blue: 152.0 / 255.0, alpha: 1.0)


        // add views
        self.view.addSubview(closeButton)
        self.view.addSubview(profileImageView)
        self.view.addSubview(profileNameLabel)
        self.view.addSubview(horizontalBar)
        self.view.addSubview(toolStack)
        
        
        
        // set layouts
        self.closeButtonLayout()
        self.profileImageViewLayout()
        self.profileNameLabelLayout()
        self.horizontalBarLayout()
        self.toolStackLayout()
        
        
        // add actions
        self.closeButton.addTarget(self, action: #selector(closeButtonTapped(_:)), for: .touchUpInside)
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(toolBarItemTapped(_:)))
        [self.toolItem1, self.toolItem2, self.toolItem3].forEach {
            $0.addGestureRecognizer(tapGesture)
            $0.isUserInteractionEnabled = true
        }
        
        let dragDownGesture = UIPanGestureRecognizer(target: self, action: #selector(dragDownToDismiss(_:)))
        self.view.addGestureRecognizer(dragDownGesture)
        
        
    }
    
    func closeButtonLayout() {
        self.closeButton.snp.makeConstraints {
            $0.width.equalTo(13)
            $0.height.equalTo(14)
            $0.leading.equalToSuperview().offset(18)
            $0.top.equalToSuperview().offset(58)
        }
    }
    
    func profileImageViewLayout() {
        self.profileImageView.snp.makeConstraints {
            $0.width.equalTo(97)
            $0.height.equalTo(96)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(202)
            
        }
    }
    
    func profileNameLabelLayout() {
        self.profileNameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.profileImageView.snp.bottom).offset(8)
        }
    }
    
    func horizontalBarLayout() {
        self.horizontalBar.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
            $0.bottom.equalToSuperview().inset(130)
        }
    }
    
    func toolItemsLayout() {
    
        // item1
        self.toolItem1.addSubview(imageView1)
        self.toolItem1.addSubview(label1)
        
        toolItem1.snp_makeConstraints {
            $0.width.equalTo(96)
            $0.height.equalTo(72)
        }
        
        imageView1.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(39)
            $0.top.equalToSuperview().offset(22)
        }
        
        label1.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(48)
        }
        
        
        // item2
        self.toolItem2.addSubview(imageView2)
        self.toolItem2.addSubview(label2)
        
        toolItem2.snp_makeConstraints {
            $0.width.equalTo(96)
            $0.height.equalTo(72)
        }
        
        imageView2.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(39)
            $0.top.equalToSuperview().offset(22)
        }
        
        label2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(48)
        }
        
        
        // item3
        self.toolItem3.addSubview(imageView3)
        self.toolItem3.addSubview(label3)
        
        toolItem3.snp_makeConstraints {
            $0.width.equalTo(96)
            $0.height.equalTo(72)
        }
        
        imageView3.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(39)
            $0.top.equalToSuperview().offset(22)
        }
        
        label3.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(48)
        }
        
    }
    
    
    func toolStackLayout() {
        
        self.toolItemsLayout()
        self.toolStack.addArrangedSubview(toolItem1)
        self.toolStack.addArrangedSubview(toolItem2)
        self.toolStack.addArrangedSubview(toolItem3)
        
        self.toolStack.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(47)
        }
        
    }
    
    
    
    
    
   
    
    
    @objc func closeButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @objc func toolBarItemTapped(_ sender: UIButton) {
        print("ToolBarItemTapped")
    }
    
    
    var initialTouchpoint = CGPoint(x: 0, y: 0)
    
    @objc func dragDownToDismiss(_ sender: UIPanGestureRecognizer) {
        
        let touchpoint = sender.location(in: self.view.window)
        
        if sender.state == .began {
            initialTouchpoint = touchpoint
        }
        else if sender.state == .changed {
            if touchpoint.y - initialTouchpoint.y > 0 {
                self.view.frame = CGRect(x: 0, y: touchpoint.y - initialTouchpoint.y , width: self.view.frame.width , height: self.view.frame.height)
            }
        } else if sender.state == .ended || sender.state == .cancelled {
            if touchpoint.y - initialTouchpoint.y > 200 {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3) {
                self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                }
            }
            
        }
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
