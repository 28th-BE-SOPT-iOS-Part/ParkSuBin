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
        
        let vc1 = self.presentingViewController
        
            self.dismiss(animated: true) {
            guard let mainVC = vc1 as? UINavigationController else {
                return
            }
            
            mainVC.popToRootViewController(animated: true)
                
        }
      
    }
}

