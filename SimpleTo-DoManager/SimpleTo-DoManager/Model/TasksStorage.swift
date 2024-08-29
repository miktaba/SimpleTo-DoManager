//
//  TasksStorage.swift
//  SimpleTo-DoManager
//
//  Created by Mikhail Tabakaev on 8/27/24.
//

import Foundation

protocol TasksStorageProtocol {
    func loadTasks() -> [TaskProtocol]
    func saveTasks(_ tasks: [TaskProtocol])
}

class TasksStorage: TasksStorageProtocol {
    func loadTasks() -> [any TaskProtocol] {
        let testTasks: [TaskProtocol] = [
            Task(title: "Buy bread", type: .normal, status: .planned),
            Task(title: "Go to the gym", type: .normal, status: .completed),
            Task(title: "Write a letter", type: .important, status: .planned),
            Task(title: "Call my parents", type: .important, status: .planned),
            Task(title: "Print docs", type: .important, status: .completed),
            ]
        return testTasks
    }
    
    func saveTasks(_ tasks: [TaskProtocol]) {}
}
