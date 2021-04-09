//
//  WelcomeViewController.swift
//  SOPT-1st-Assignment
//
//  Created by Subeen Park on 2021/04/09.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var message: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLabel()
    }
    
    func setLabel() {
        if let msg = self.message {
            welcomeLabel.text = "\(msg)님 \n 환영합니다"
        }
    }

    @IBAction func goBackToSignIn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "SignInViewController") as? SignInViewController  else {
            return
        }
        
        self.navigationController?
            .pushViewController(nextVC, animated: false)
        
        
        
      
    }
}

