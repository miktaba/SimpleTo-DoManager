//
//  TaskEditControllerTableViewController.swift
//  SimpleTo-DoManager
//
//  Created by Mikhail Tabakaev on 8/29/24.
//

import UIKit

class TaskEditControllerTableViewController: UITableViewController {
    var taskText: String?
    var taskType: TaskPriority = .normal
    var taskStatus: TaskStatus = .planned
    var doAfterEdit: ((String, TaskPriority, TaskStatus) -> Void)?
    
    private var taskTitles: [TaskPriority: String] = [
        .important: "Important",
        .normal: "Current"
    ]
    
    @IBOutlet var taskTitleLable: UITextField!
    @IBOutlet var taskTypeLabel: UILabel!

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTitleLable?.text = taskText
        taskTypeLabel?.text = taskTitles[taskType]
    }

}
