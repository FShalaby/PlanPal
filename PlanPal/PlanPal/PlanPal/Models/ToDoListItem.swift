//
//  ToDoListItem.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import Foundation

struct ToDoListItem: Codable, Identifiable
{
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    
    mutating func setDone(_ state: Bool)
    {
        isDone = state
    }
    
   
}
