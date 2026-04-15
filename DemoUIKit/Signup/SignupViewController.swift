//
//  SignupViewController.swift
//  DemoUIKit
//
//  Created by Hammad Ali on 12/04/2026.
//

import UIKit

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
    }
    
    
    @IBAction func SignupButtonTapped(_ sender: UIButton) {
        
        // get value from user
        
        let username = username.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let email = email.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let password = password.text?.trimmingCharacters(in: .whitespaces) ?? ""
        
        
        // save - UserDefaults
        
        UserDefaults.standard.set(username, forKey: "Save_Username")
        UserDefaults.standard.set(email, forKey: "Save_email")
        UserDefaults.standard.set(password, forKey: "Save_password")
        
        // navigate to Dashboard
        
        navigateToDashBoard()
        
    }
    
    private func  navigateToDashBoard(){
        
        let dashVC = DashBoardViewController(nibName: "DashBoardViewController", bundle: nil)
        guard let window = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.windows.first else { return }
        UIView.transition(with: window, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            window.rootViewController = dashVC
        })
    }
    
    
    @IBAction func gotoLogin(_ sender: UIButton) {
//        let loginVC = LoginViewController(nibName: "LoginViewController", bundle: nil)
//        present(loginVC, animated: true)
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
