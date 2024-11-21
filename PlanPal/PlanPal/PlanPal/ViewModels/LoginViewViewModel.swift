//
//  LoginViewViewModel.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject
{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var forgotPassword = false
    init(){}
    
    func login()
    {
        guard validate() else
        {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    func validate() -> Bool
    {
        errorMessage=""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,!password.trimmingCharacters(in: .whitespaces).isEmpty else
        {
            errorMessage = "Please Fill In All Fields."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else
        {
            errorMessage = "Please Enter Valid Email."
            return false
        }
        return true
    }
    
}
