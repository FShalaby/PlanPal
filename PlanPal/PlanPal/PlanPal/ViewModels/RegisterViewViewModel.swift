//
//  RegisterViewViewModel.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject
{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init(){}
    
    func register()
    {
        guard validate() else
        {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else
            {
                return
            }
            self?.insertUserRecord(id: userId)
            self?.sendEmailVerification()
        }
    }
    
    private func insertUserRecord(id: String)
    {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool
    {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else
        {
            return false
        }
        guard email.contains("@") && email.contains(".") else
        {
            return false
        }
        
        guard password.count >= 6 else
        {
            return false
        }
        return true
    }
    
    private func sendEmailVerification() {
        Auth.auth().currentUser?.sendEmailVerification { error in
            if let error = error {
                // Handle the error (e.g., display an error message to the user)
                print("Error sending verification email: \(error.localizedDescription)")
            } else {
                // Verification email sent successfully
                print("Verification email sent successfully.")
                // You can also show a message to the user indicating that a verification email has been sent.
            }
        }
    }
    
   
}
