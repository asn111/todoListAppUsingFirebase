//
//  RegisterUserViewController.swift
//  todoList
//
//  Created by Ahsan Iqbal on 13/12/2018.
//  Copyright © 2018 SelfIT. All rights reserved.
//

import UIKit

class RegisterUserViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var rePassTF: UITextField!
    
    
    //MARK: Actions
    @IBAction func registerBtnPressed(_ sender: Any) {
        
        if isValidEmail(testStr: userNameTF.text!) {
            if passwordTF.text == rePassTF.text {
                if isPasswordValid(passwordTF.text!) {
                    FirebaseApiCalls.shared.createUser(email: userNameTF.text!, passWord: passwordTF.text!, vc: self) {responce in
                        print(responce)
                            if (responce == true) {
                                if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Main") as? MainViewController {
                                    if let navigator = self.navigationController {
                                        navigator.modalTransitionStyle = .flipHorizontal
                                        self.present(viewController, animated: true, completion: nil)
                                }
                            }
                        }
                    }
                } else {
                    showAlert(title: "Error", message: "Password must contain atleast one Alphabet & one number", viewControler: self)
                }
            } else {
                showAlert(title: "Error", message: "Password should match", viewControler: self)
            }
        } else {
            showAlert(title: "Error", message: "Email should be like 'abc@abcde.abc'", viewControler: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
