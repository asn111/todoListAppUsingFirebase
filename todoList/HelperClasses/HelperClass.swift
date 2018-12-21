//
//  HelperClass.swift
//  Moment Clone
//
//  Created by Ahsan Iqbal on 06/11/2018.
//  Copyright © 2018 SelfIT. All rights reserved.
//

import Foundation
import UIKit

// Base URL

// Headers

// Endpoints


// User Device

var PUSH_NOTIFICATIONS = "app_notifications"


// show alert box
func showAlert(title: String, message: String , viewControler: UIViewController){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    viewControler.present(alert, animated: true)
}

// Convert String date to DateTime
func getTimeInString(date: String) -> Date {
    var time: Date
    let dateFormater = DateFormatter()
    dateFormater.dateFormat = "yyyy-MM-dd"
    time = dateFormater.date(from: date)!
    return time
}

// Validate Email syntax
func isValidEmail(testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

func isValidName(testStr:String) -> Bool {
    let emailRegEx = "[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

//    1 - Password length is !< 6.
//    2 - One Alphabet in Password.
func isPasswordValid(_ password : String) -> Bool{
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{6,30}")
    return passwordTest.evaluate(with: password)
}

// Mark: alphaCheck
extension String {
    
    func isAlphanumeric() -> Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }
    func isAlphanumeric(ignoreDiacritics: Bool = false) -> Bool {
        if ignoreDiacritics {
            return self.range(of: "[^a-zA-Z]", options: .regularExpression) == nil && self != ""
        }
        else {
            return self.isAlphanumeric()
        }
    }
}
