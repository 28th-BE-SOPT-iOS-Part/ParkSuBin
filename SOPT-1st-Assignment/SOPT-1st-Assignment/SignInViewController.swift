//
//  SignInViewController.swift
//  SOPT-1st-Assignment
//
//  Created by Subeen Park on 2021/04/09.
//

import UIKit

class SignInViewController: UIViewController {


    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emailTF.underlined()
        passwordTF.underlined()
    }
    
    @IBAction func goLogin(_ sender: UIButton) {
        
        
        if emailTF.hasText && passwordTF.hasText {
            guard let nextVC: WelcomeViewController = self.storyboard?.instantiateViewController(identifier: "WelcomeViewController") else {
                return
            }
            
            
            nextVC.modalPresentationStyle = .fullScreen
            nextVC.modalTransitionStyle = .coverVertical
            nextVC.message = emailTF.text
            
            self.present(nextVC, animated: true, completion: nil)
        }
        
        

    }
    
    
    @IBAction func goSignUp(_ sender: Any) {
        
        guard let nextVC =
                self.storyboard?.instantiateViewController(identifier: "SignUpViewController")
                as? SignUpViewController else { return }

        self.navigationController?
            .pushViewController(nextVC, animated: true)
        
    }
    


}
