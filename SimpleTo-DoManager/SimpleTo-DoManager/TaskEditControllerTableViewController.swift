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
    @IBOutlet var taskStatusSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTitleLable?.text = taskText
        taskTypeLabel?.text = taskTitles[taskType]
        
        if taskStatus == .completed {
            taskStatusSwitch.isOn = true
        }
    }
    
    @IBAction func saveTask(_ sender: UIBarButtonItem) {
        let trimmedText = taskTitleLable.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        guard !trimmedText.isEmpty else {
            showAlert(with: "Error", message: "The field must not be empty or consist only of spaces")
            return
        }

        let title = trimmedText
        let type = taskType
        let status: TaskStatus = taskStatusSwitch.isOn ? .completed : .planned
        doAfterEdit?(title, type, status)
        navigationController?.popViewController(animated: true)

    }
    
    func showAlert(with title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController,animated: true, completion: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTaskTypeScreen" {
            let destination = segue.destination as! TaskTypeControllerTableViewController
            destination.selectedType = taskType
            destination.doAfterTypeSelected = { [unowned self] selectedType in
                taskType = selectedType
                taskTypeLabel.text = taskTitles[taskType]
            }
        }
    }
}
