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
        
        
        // validations
        if username.isEmpty {
            showalert("Please enter username")
            return
        }

        if email.isEmpty {
           showalert("Please enter email")
            return
        }

        // Email format Validation
//        if !isValidEmail(email) {
//           // showalert("Please enter a valid email address")
//            return
//        }

        if password.isEmpty {
            showalert("Please enter password")
            return
        }

//        password lenght
        if password.count < 6 {
           // showalert("Password must be at least 6 characters")
            return
        }
        
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
    
    // alet message
    
    private func showalert(_ message: String){
        let alert =  UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
        
        
    }
}
