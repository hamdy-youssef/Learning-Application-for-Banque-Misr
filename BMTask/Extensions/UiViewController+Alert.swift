//
//  UiViewController+Alert.swift
//  BMTask
//
//  Created by Hamdy Youssef on 06/08/2023.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, messege: String) {
        let alert = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
        
    }
}
