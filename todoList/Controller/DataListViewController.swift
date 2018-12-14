//
//  DataListViewController.swift
//  todoList
//
//  Created by Ahsan Iqbal on 13/12/2018.
//  Copyright © 2018 SelfIT. All rights reserved.
//

import UIKit

class DataListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addBtnPressed(_ sender: Any) {
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "submitTask") as? SubmitTaskViewController {
            if let navigator = self.navigationController {
                navigator.modalTransitionStyle = .flipHorizontal
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    //MARK: Properties
    var taskData = [String]()
    var dateNTime = [String]()
    var rowHight: CGFloat = 85.0
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.isNavigationBarHidden = true
        
        taskData = Preference.shared.getArrayValue(currentLevelKey: Constants.shared.currentLevelKeyTask) as! [String]
        dateNTime = Preference.shared.getArrayValue(currentLevelKey: Constants.shared.currentLevelKeyDate) as! [String]
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        // hides Navigation bar
        self.navigationController?.isNavigationBarHidden = true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init(frame: .zero)
        tableView.register(UINib(nibName: "DataCell", bundle: nil), forCellReuseIdentifier: "dataCel")
        taskData = Preference.shared.getArrayValue(currentLevelKey: Constants.shared.currentLevelKeyTask) as! [String]
        dateNTime = Preference.shared.getArrayValue(currentLevelKey: Constants.shared.currentLevelKeyDate) as! [String]

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskData.count 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCel", for: indexPath) as! DataCell
        
        cell.taskLbl.text = taskData[indexPath.item]
        cell.datetimeLbl.text = dateNTime[indexPath.item]
        
        return cell
    }
}
