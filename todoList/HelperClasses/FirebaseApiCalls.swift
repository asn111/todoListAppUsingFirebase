//
//  FirebaseApiCalls.swift
//  todoList
//
//  Created by Ahsan Iqbal on 13/12/2018.
//  Copyright © 2018 SelfIT. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class FirebaseApiCalls {
    static let shared = FirebaseApiCalls()
    
    // Register User
    func createUser(email: String, passWord: String, vc: UIViewController,completion: @escaping (Bool) -> Void) {
        var userCreated = false
        Auth.auth().createUser(withEmail: email, password: passWord) { (user, error) in
            if error == nil {
                print("user Created")
                userCreated = true
                completion(userCreated)
            } else {
                showAlert(title: "Error", message: (error?.localizedDescription)!, viewControler: vc )
            }
        }
    }
    
    //User Login
    func login(email: String, passWord: String, vc: UIViewController, completion: @escaping (Bool) -> Void) {
        var userLogin = false
        Auth.auth().signIn(withEmail: email, password: passWord) { (user, error) in
            if error == nil {
                print("user Login")
                userLogin = true
                completion(userLogin)
            } else {
                showAlert(title: "Error", message: (error?.localizedDescription)!, viewControler: vc )
            }
        }
    }
    
    //User Logout
    func logout() {
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
