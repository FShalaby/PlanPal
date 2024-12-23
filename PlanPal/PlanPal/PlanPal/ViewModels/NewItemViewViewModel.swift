//
//  NewItemViewViewModel.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject
{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    init(){}
    
    func save()
    {
        guard canSave else
        {
            return
        }
        
        // Get Current User Id
        
        guard let uId =  Auth.auth().currentUser?.uid else{
            return
        }
        
        //Create Model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId, title: title, dueDate: dueDate.timeIntervalSince1970 , createdDate: Date().timeIntervalSince1970, isDone: false)
        
        
        
        //Save Model -> DataBase
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("Tasks")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool
    {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else
        {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400)
                else
        {
            return false 
        }
        
        return true
    }
}

