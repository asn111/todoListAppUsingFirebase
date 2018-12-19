//
//  SubmitTaskViewController.swift
//  todoList
//
//  Created by Ahsan Iqbal on 13/12/2018.
//  Copyright © 2018 SelfIT. All rights reserved.
//

import UIKit

class SubmitTaskViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var taskTF: UITextView!
    @IBOutlet weak var dateNtimeTF: UITextField!
    
    //Properties
    var taskData = [String]()
    var dateNTime = [String]()
    
    //MARK: Actions
    @IBAction func addBtnPressed(_ sender: Any) {
        if taskTF.text.isEmpty || (dateNtimeTF.text?.isEmpty)! {
            showAlert(title: "Error", message: "Please add task Before submitting", viewControler: self)
        } else {

            taskData.append(taskTF.text)
            dateNTime.append(dateNtimeTF.text!)

            Preference.shared.setArrayValue(array: taskData, currentLevelKey: Constants.shared.currentLevelKeyTask)
            Preference.shared.setArrayValue(array: dateNTime, currentLevelKey: Constants.shared.currentLevelKeyDate)
            dateNtimeTF.text?.removeAll()
            taskTF.text.removeAll()
        }
    }
    
    @IBAction func dateTimePressed(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .dateAndTime
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy h:mm a"
        dateNtimeTF.text = dateFormatter.string(from: sender.date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(false, animated: true)
        // hides Navigation bar
        self.navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
        
        taskData = Preference.shared.getArrayValue(currentLevelKey: Constants.shared.currentLevelKeyTask) as! [String]
        dateNTime = Preference.shared.getArrayValue(currentLevelKey: Constants.shared.currentLevelKeyDate) as! [String]
        print(Preference.shared.getData(currentLevelKey: Constants.shared.currentLevelKeyNotif))
    }
    
}
