//
//  DataCell.swift
//  todoList
//
//  Created by Ahsan Iqbal on 13/12/2018.
//  Copyright © 2018 SelfIT. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

    
    @IBOutlet weak var taskLbl: UILabel!
    @IBOutlet weak var datetimeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
