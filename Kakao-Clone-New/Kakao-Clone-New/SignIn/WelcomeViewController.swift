//
//  WelcomeViewController.swift
//  Kakao-Clone-New
//
//  Created by Subeen Park on 2021/05/11.
//

import UIKit

class WelcomeViewController: UIViewController {

    var message: String = ""

    let confirmButton = UIButton().then {
        $0.backgroundColor = .yellow
        $0.setTitle("확인", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 17)
        $0.setTitleColor(.black, for: .normal)
        
    }
    
    let welcomeLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        // add views
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(confirmButton)
        
        welcomeLabel.text = "\(message)님\n 환영합니다"

        // decide layout
        self.welcomeLabelLayout()
        self.confirmButtonLayout()
        
        
        
        // add target
        self.confirmButton.addTarget(self, action: #selector(confirmButtonClicked(_:)), for: .touchUpInside)
        
        
    }
    
    func welcomeLabelLayout() {
        self.welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(200)
        }
    }
    
    func confirmButtonLayout() {
        self.confirmButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(320)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    @objc func confirmButtonClicked(_ sender: UIButton) {
        
        let vc1 = self.presentingViewController
        
        self.dismiss(animated: true) {
            guard let mainVC = vc1 as? UINavigationController else {return}
            mainVC.popToRootViewController(animated: true)
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
