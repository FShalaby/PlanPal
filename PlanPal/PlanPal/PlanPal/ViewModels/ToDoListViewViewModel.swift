//
//  ToDoListViewViewModel.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject
{
    @Published var showingNewItemView = false
    private let userId:String
    init(userId: String){
        self.userId = userId
    }
    
    func delete(id: String)
    {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("Tasks")
            .document(id)
            .delete()
    }
}
