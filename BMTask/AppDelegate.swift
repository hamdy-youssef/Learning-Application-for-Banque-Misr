//
//  AppDelegate.swift
//  BMTask
//
//  Created by Hamdy Youssef on 30/07/2023.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let postData: [String: String] = ["name": "hamdyYoussef", "salary": "2000", "age": "32"]
    let movieData: [String: String] = ["term": "ali", "media": "movie"]
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        IQKeyboardManager.shared.enable = true
        
//        APIManager.getMovies(parameter: movieData) { error, mediaArr in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let mediaArr = mediaArr {
//                //                print (empArr)
//            }
//        }
//        APIManager.getEmployees(parameter: postData) { error, empArr in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let empArr = empArr {
////                print (empArr
//            }
//        }
        
        
        if let isLoggedIn = UserDefaults.standard.object(forKey: "isLoggedIn") as? Bool {
            if isLoggedIn {
                setMovieScreenTobeRoot()
            }else {
                setLoginScreenTobeRoot ()
            }
        }
        return true
    }

    func setLoginScreenTobeRoot () {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "SecondVc") as! SecondVc
        self.window?.rootViewController = loginVC
    }
    
    func setProfileScreenTobeRoot ( ) {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let profileVC = sb.instantiateViewController (withIdentifier: "ProfileVc") as! ProfileVc
        self.window?.rootViewController = profileVC
    }
    
    func setMovieScreenTobeRoot() {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let movieVC = sb.instantiateViewController (withIdentifier: "MovieList") as! MovieList
        self.window?.rootViewController = UINavigationController(rootViewController: movieVC)
    }
}

