//
//  SignUpViewController.swift
//  SOPT-1st-Assignment
//
//  Created by Subeen Park on 2021/04/09.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordConfirmTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTF.underlined()
        passwordConfirmTF.underlined()
        passwordTF.underlined()
       
    }

    @IBAction func goWelcome(_ sender: Any) {
        
        print(emailTF.text!)
        print(passwordConfirmTF.text!)
        
        if emailTF.hasText && passwordTF.hasText && passwordTF.hasText {
            if passwordTF.text! == passwordConfirmTF.text! {
                guard let nextVC:WelcomeViewController = self.storyboard?.instantiateViewController(identifier: "WelcomeViewController") else {
                    return
                }
                

                nextVC.modalPresentationStyle = .fullScreen
                nextVC.modalTransitionStyle = .coverVertical
                nextVC.message = emailTF.text
                
                self.present(nextVC, animated: true, completion: nil)
            }
        }
        
    }
    
}

