//
//  SplashViewController.swift
//  DemoUIKit
//
//  Created by Hammad Ali on 09/04/2026.
//

import UIKit

class SplashViewController: UIViewController {
    
   
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var taglabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startSplashTimer()
        // Do any additional setup after loading the view.
    }
    
    private func startSplashTimer() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.navigateToLoginScreen()
            
        }
        
    }
    
    private func navigateToLoginScreen() {

        let loginVC = LoginViewController()
        
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//              let window = windowScene.windows.first else { return }
//        
//        UIView.transition(with: window,
//                          duration: 0.5,
//                          options: .transitionCrossDissolve,
//                          animations: {
//            window.rootViewController = signVC
//        })
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
}
