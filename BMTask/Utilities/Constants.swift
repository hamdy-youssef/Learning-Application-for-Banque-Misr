//
//  Constants.swift
//  BMTask
//
//  Created by Hamdy Youssef on 06/08/2023.
//

import Foundation

struct UserDefaultsKeys {
    
    static let userData = "UserData"
    static let isLoggedIn = "isLoggedIn"
}

struct RegexConstants {
    static let email = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
    static let predicateFormat = "SELF MATCHES %@"
}

struct AlertConstants {
    static let errorTitle = "Sorry"
    static let actionTitle = "Ok"
}

struct ViewControllerIDs {
    static let register = "ViewController"
    static let login = "SecondVc"
    static let profile = "ProfileVC"
}

struct StorBoards {
    static let main = "Main"
}

struct ErrorMessages {
static let somethingWentWrong = "Something went wrong, please try again later!"
}

struct URLs {
    static let employess = "https://dummy.restapiexample.com/api/v1/employees"
    static let mediaSearch = "https://itunes.apple.com/search?"
}

struct Networking {
    static let noData = "faild"
}


