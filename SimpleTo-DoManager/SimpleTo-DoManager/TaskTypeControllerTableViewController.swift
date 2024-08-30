//
//  TaskTypeControllerTableViewController.swift
//  SimpleTo-DoManager
//
//  Created by Mikhail Tabakaev on 8/29/24.
//

import UIKit

class TaskTypeControllerTableViewController: UITableViewController {
    
    var doAfterTypeSelected: ((TaskPriority) -> Void)?
    
    typealias TypeCellDescription = (type: TaskPriority, title: String, description: String)
    
    private var taskTypeInformation: [TypeCellDescription] = [(
        type: .important,
        title: "Important",
        description: """
            This type of tasks is the highest priority for execution.
            All important tasks are displayed at the top of the task list.
            """
    ), (
        type: .normal,
        title: "Current",
        description: "Task with normal priority"
    )
    ]
    
    var selectedType: TaskPriority? = .normal
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellTypeNib = UINib(nibName: "TaskTypeCellTableViewCell", bundle: nil)
        tableView.register(cellTypeNib, forCellReuseIdentifier: "TaskTypeCellTableViewCell")
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedType = taskTypeInformation[indexPath.row].type
        doAfterTypeSelected?(selectedType)
        navigationController?.popViewController(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTypeCellTableViewCell", for: indexPath) as! TaskTypeCellTableViewCell
        
        let typeDescription = taskTypeInformation[indexPath.row]
        cell.typeTitle.text = typeDescription.title
        cell.typeDescription.text = typeDescription.description
        
        if selectedType == typeDescription.type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskTypeInformation.count
    }
    
    
}
