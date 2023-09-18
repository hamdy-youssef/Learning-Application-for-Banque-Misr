//
//  ViewController.swift
//  BMTask
//
//  Created by Hamdy Youssef on 30/07/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var lastNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var confirmPassText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var passDigitLabel: UILabel!
    
    let imagePicker = UIImagePickerController()
    var alertMessage: String!
    var checkConditionCounter: Int = 0
    let emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTabForImageView()
        setImageCircle()
    }
    
    @objc func imageViewTapped() {
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func isValidEmail(email: String) -> Bool {
        if !email.trimm.isEmpty {
            print("email")
            if ValidationManager.shared().isValidEmail(email: email) {
                print("not valid")
                showAlert (title: "Sorry", messege: "please enter valid email!")
                return false
            }
            return true
        } else {
            print(" valid")
            showAlert(title: "Sorry", messege: "the email is required!")
            return false
        }
    }
    
    func isValidPassword(password: String) -> Bool {
        if !password.trimm.isEmpty {
            if !ValidationManager.shared().isValidPassword(password: password) {
                showAlert(title: "Sorry", messege: "the password should contains at least 6 characters")
                return false
            }
            return true
        }else {
            showAlert(title: "Sorry", messege: "the password is required!")
            return false
        }
    }

    func isConfirmedPassword (password: String, confirmedPassword: String) -> Bool {
        if password != confirmedPassword {
            showAlert(title: "Sorry", messege: "the password and its confirmation aren't matched!")
            return false
        }
        return true
    }
    
    func isValidPhoneNum(phoneNum: String) -> Bool {
        if phoneNum.trimm.isEmpty {
            showAlert(title: "Sorry", messege: "the phone number is required!")
            return false
        }
        return true
    }
    
    func showAlert() {
        let alertController = UIAlertController(title: "Wrong!", message: alertMessage, preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
           
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func validateFields () -> Bool {
        if let email = emailText.text, isValidEmail(email: email), let password =
            passText.text, isValidPassword(password: password), let confirmedPassword = confirmPassText.text, isConfirmedPassword(password: password,confirmedPassword: confirmedPassword), let phoneNum = passText.text,
           isValidPhoneNum (phoneNum: phoneNum) {
            return true
            
        }
    return false
    }
    
    func goToLoginScreen(user: User) {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController (withIdentifier: "SecondVc") as! SecondVc
        loginVC.user = user
        self.present (loginVC, animated: true)
    }
    
    

    @IBAction func passTextAction(_ sender: Any) {
        if passText.text!.count < 6 {
            passDigitLabel.text = "The password Should Be More Than 6 Charachter"
        }else{
            passDigitLabel.text = ""
        }
    }

    @IBAction func signUp(_ sender: Any) {
        if validateFields (){
            guard let firstName = firstNameText.text, let lastName =
                    lastNameText.text, let email = emailText.text, let password = passText.text, let phoneNum = phoneText.text, let address = addressText.text else {return}
            let user = User(firstName: firstName, lastName: lastName, email: email, password: password, phoneNum: phoneNum, address: address)
            UserDefaultsManager.shared () .saveUserData(user: user)
            goToLoginScreen(user: user)
        }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func setImageCircle() {
        imageView.layer.borderWidth = 1
        imageView.layer.masksToBounds = false
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.cornerRadius = imageView.frame.height/2
        imageView.clipsToBounds = true
    }
    
    func addTabForImageView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
           imageView.isUserInteractionEnabled = true
           imageView.addGestureRecognizer(tapGestureRecognizer)
           imagePicker.delegate = self
           imagePicker.sourceType = .photoLibrary
           imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
}

    
