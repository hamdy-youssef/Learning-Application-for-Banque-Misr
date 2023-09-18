//
//  SecondVc.swift
//  BMTask
//
//  Created by Hamdy Youssef on 01/08/2023.
//

import UIKit

class SecondVc: UIViewController {
    var name: String!
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    var user: User!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = UserDefaultsManager.shared().loadUserData () {
        self.user = user
        } else {
            showAlert(title: AlertConstants.errorTitle, messege:ErrorMessages.somethingWentWrong)
        }

        // Do any additional setup after loading the view.
    }
    
    func isValidatCredentials () -> Bool {
        if let email = emailText.text, !email.trimm.isEmpty, email == self.user.email, let
            password = passText.text, !password.trimm.isEmpty, password ==
            self.user.password {
            return true
            
        }
        return false
    }
    
    func goToProfileScreen(user: User) {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let profileVC = sb.instantiateViewController(withIdentifier: "MovieList") as! MovieList
//        profileVC.user = user
        self.present (profileVC, animated: true)
    }

    @IBAction func loginBtn(_ sender: Any) {
        if isValidatCredentials () {
            goToProfileScreen(user: self.user)
        } else {
            showAlert(title: "Sorry", messege: "please enter valid credentials!")
        }
    }
    
}
