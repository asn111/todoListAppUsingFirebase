//
//  ViewController.swift
//  todoList
//
//  Created by Ahsan Iqbal on 13/12/2018.
//  Copyright © 2018 SelfIT. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    //MARK: Actions
    @IBAction func loginBtnPressed(_ sender: Any) {
        FirebaseApiCalls.shared.login(email: userNameTF.text!, passWord: passwordTF.text!, vc: self) {
            responce in
            print(responce)
            if responce == true {
                print("user successfuly Loggedin")
                if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "dataList") as? DataListViewController {
                    if let navigator = self.navigationController {
                        navigator.modalTransitionStyle = .flipHorizontal
                        navigator.pushViewController(viewController, animated: true)
                    }
                }
                Preference.shared.setStatus(value: true, currentLevelKey:Constants.shared.currentLevelKeyStatus)
            }
        }
    }
    @IBAction func RegUserBtnPressed(_ sender: Any) {
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "regScreen") as? RegisterUserViewController {
            if let navigator = navigationController {
                navigator.modalTransitionStyle = .flipHorizontal
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        // hides Navigation bar
        self.navigationController?.isNavigationBarHidden = true
        
        if Preference.shared.getStatus(currentLevelKey: Constants.shared.currentLevelKeyStatus) == true {
            if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "dataList") as? DataListViewController {
                if let navigator = self.navigationController {
                    navigator.modalTransitionStyle = .flipHorizontal
                    navigator.pushViewController(viewController, animated: true)
                }
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

