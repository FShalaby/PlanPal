//
//  ToDoListItemViewViewModel.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-19.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel: ObservableObject
{
    init(){}
    
    func toggleisDone(item: ToDoListItem )
    {
        var itemCopy = item
        
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else
        {
            return
        }
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("Tasks")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
