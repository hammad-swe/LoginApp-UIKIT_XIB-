//
//  LoginViewController.swift
//  DemoUIKit
//
//  Created by Hammad Ali on 10/04/2026.
//

import UIKit

class LoginViewController: UIViewController {
    
 
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var eyeButton: UIButton!
    
    
    
    private var isPassShow = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        
        navigationItem.hidesBackButton = true
      passTextField.isSecureTextEntry = true
        
    }
    
    // password show and hide
    
    @IBAction func eyeTapped(_ sender: UIButton) {
        
        isPassShow.toggle()
        
        passTextField.isSecureTextEntry = !isPassShow
        
    }
    
    // for login user
    
    @IBAction func LoginTapped(_ sender: UIButton) {
        
        //        get value
        let username = userTextField.text?.trimmingCharacters(in: .whitespaces) ?? ""
        let password = passTextField.text ?? ""
        // read user
        let savedUsername = UserDefaults.standard.string(forKey: "Save_Username") ?? ""
        let savedPassword = UserDefaults.standard.string(forKey: "Save_password") ?? ""
        // compare user
        
        guard username == savedUsername, password == savedPassword else {
            showalert("Incorrect username or Password")
            return
        }
        
        
        
        navigateToDashBoard()
    }
    
    // navigate to dashboard
    private func  navigateToDashBoard(){
        
        let dashVC = DashBoardViewController(nibName: "DashBoardViewController", bundle: nil)
        let navController = UINavigationController(rootViewController: dashVC)
        guard let window = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.windows.first else { return }
        UIView.transition(with: window, duration: 0.4,
                          options: .transitionCrossDissolve,
                          animations: {
            window.rootViewController = navController 
        })
    }
    
    // navigate to signup screeen if user login not exists
    
    @IBAction func gotoSignUp(_ sender: UIButton) {
        
        let vc = SignupViewController()
        self.navigationController?.pushViewController(vc, animated: true)
//        let signVC = SignupViewController(nibName: "SignUpViewController", bundle: nil)
//        present(signVC, animated: true)
    }
    
    
    
    // alet message
    
    private func showalert(_ message: String){
        let alert =  UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
        
        
    }
    
    
}
