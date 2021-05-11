//
//  ViewController.swift
//  Kakao-Clone-New
//
//  Created by Subeen Park on 2021/05/11.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    
    // MARK: Properties
    let headerTextLabel = UILabel().then {
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 30, weight: .semibold)
        $0.textColor = .black
        $0.textAlignment = .center
    }

    let subTextLabel = UILabel().then {
        $0.text = """
            사용하던 카카오 계정이 있다면
            이메일 또는 전화번호로 로그인해 주세요.
            """
        $0.font = .systemFont(ofSize: 18)
        $0.numberOfLines = 2
        $0.textColor = .lightGray
        $0.textAlignment = .center
    }
    
    let emailOrPhoneTextField = UITextField().then {
        $0.placeholder = "이메일 또는 전화번호"
        $0.clearButtonMode = .whileEditing
        $0.borderStyle = .none
    }
    
    let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.clearButtonMode = .whileEditing
        $0.borderStyle = .none
        $0.isSecureTextEntry = true
    }
    
    let textFieldStackView = UIStackView().then {
        $0.spacing = 20
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.alignment = .fill
    }
    
    let signInButton = UIButton().then {
        $0.backgroundColor = .systemGray6
        $0.setTitle("카카오 계정 로그인", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 17)
        $0.setTitleColor(.black, for: .normal)
    }
    
    let signUpButton = UIButton().then {
        $0.backgroundColor = .systemGray6
        $0.setTitle("새로운 계정 만들기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 17)
        $0.setTitleColor(.black, for: .normal)
        
    }
    
    let buttonStackView = UIStackView().then {
        $0.spacing = 10
        $0.distribution = .fillEqually
        $0.axis = .vertical
        $0.alignment = .fill
    }
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        
        // add views
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(headerTextLabel)
        self.view.addSubview(subTextLabel)
        self.view.addSubview(textFieldStackView)
        self.view.addSubview(buttonStackView)
        
        
        // setup layouts
        self.headerTextLabelLayout()
        self.subTextLabelLayout()
        self.textFieldStackViewLayout()
        self.buttonStackViewLayout()
        
        
        // add targets
        self.signInButton.addTarget(self, action: #selector(signInButtonTapped(_:)), for: .touchUpInside)
        self.signUpButton.addTarget(self, action: #selector(signUpButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    // MARK: Button Navigations
    
    @objc func signInButtonTapped(_ sender: UIButton) {
        if emailOrPhoneTextField.hasText && passwordTextField.hasText {
            let welcomeViewController: WelcomeViewController = WelcomeViewController()
            welcomeViewController.message = emailOrPhoneTextField.text!
            welcomeViewController.modalPresentationStyle = .fullScreen
            self.present(welcomeViewController, animated: true)
        }
    }
    
    @objc func signUpButtonTapped(_ sender: UIButton) {

        let signUpViewController: SignUpViewController = SignUpViewController()
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    
    
    // MARK: Layout Initializing
    func headerTextLabelLayout() {
        self.headerTextLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            $0.centerX.equalToSuperview()
        }
    }
    
    func subTextLabelLayout() {
        self.subTextLabel.snp.makeConstraints {
            $0.top.equalTo(self.headerTextLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    func textFieldStackViewLayout() {
        [emailOrPhoneTextField, passwordTextField].forEach {
            self.textFieldStackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.height.equalTo(50)
            }
            self.underLineViewLayout(textField: $0)
        }
        
        self.textFieldStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(300)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
        
    }
    
    func buttonStackViewLayout() {
        [signInButton, signUpButton].forEach {
            self.buttonStackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.height.equalTo(50)
            }
        }
        
        self.buttonStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(320)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
    
    func underLineViewLayout(textField: UITextField) {
        let underLineView = UIView()
        self.view.addSubview(underLineView)
        underLineView.backgroundColor = .lightGray
        underLineView.snp.makeConstraints{ make in
            make.height.equalTo(0.5)
            make.leading.equalTo(self.textFieldStackView.snp.leading)
            make.trailing.equalTo(self.textFieldStackView.snp.trailing)
            make.top.equalTo(textField.snp.bottom).offset(1)
        }
    }
    
    
    
        


}
