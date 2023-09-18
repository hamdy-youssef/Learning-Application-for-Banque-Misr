//
//  ProfileVc.swift
//  BMTask
//
//  Created by Hamdy Youssef on 02/08/2023.
//

import UIKit

class ProfileVc: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var phoneNumLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaultsManager.shared().setIsloggedIn(isloggedIn: true)
        
        if let user = UserDefaultsManager.shared().loadUserData() {
        self.user = user
        setUserProfileData ()
        } else {
            showAlert(title: AlertConstants.errorTitle, messege: ErrorMessages.somethingWentWrong)
        }
    }
    
    func setUserProfileData() {
        firstNameLabel.text = user.firstName
        lastNameLabel.text = user.lastName
        emailLabel.text = user.email
        phoneNumLabel.text = user.phoneNum
        addressLabel.text = user.address
    }
   

}
