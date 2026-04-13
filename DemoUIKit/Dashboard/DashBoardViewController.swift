//
//  DashBoardViewController.swift
//  DemoUIKit
//
//  Created by Hammad Ali on 12/04/2026.
//

import UIKit

class DashBoardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func LogoutTapped(_ sender: UIButton) {
        
//        self.clear()
        self.gotologin()
        
        
    }
    
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        
                self.clear()
                self.gotologin()
    }
    
    // logout
    
    private func clear(){
        UserDefaults.standard.removeObject(forKey: "Save_Username")
            UserDefaults.standard.removeObject(forKey: "Save_email")
            UserDefaults.standard.removeObject(forKey: "Save_password")
    }
    
    // navigate to Login
    
    private func gotologin(){
        let lockVC = LoginViewController()
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else { return }
        
        UIView.transition(with: window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: {
            window.rootViewController = lockVC
        })

    }
    

}
