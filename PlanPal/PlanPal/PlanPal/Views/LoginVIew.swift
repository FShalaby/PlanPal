//
//  LoginVIew.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import SwiftUI

struct LoginVIew: View {
    @StateObject var viewModel = LoginViewViewModel()
   
    var body: some View {
        
        NavigationView {
               
                VStack
                {
                    HeaderView(title: "Plan Pal", subtitle: "Your Tasks, Your Way", angle: 30, background1: .blue, background2: .pink)
                    
                  
                    
                    Form
                    {
                        
                        if !viewModel.errorMessage.isEmpty
                        {
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                        
                        TextField("Email Address", text: $viewModel.email)
                            .autocapitalization(.none)
                          
                            .autocorrectionDisabled()
                        
                        SecureField("Password", text: $viewModel.password)
                        
                        ButtonView(title: "Log In", background: .blue)
                        {
                            viewModel.login()
                        }
                        .padding()
                        
//                        Button("Forgot Password?")
//                        {
//                            viewModel.forgotPassword = true
//                        }
//                        .padding(.leading, 90)
//                        .tint(Color.red)
                    }
                    
                    VStack
                    {
                        Text("New Around Here?")
                        NavigationLink("Create An Account", destination: RegisterView())
                            .tint(Color.blue)
                        
                    
                    }
                    .padding(.bottom, 50)
                    
                    
                    Spacer()
                    
            }
                
            
            
        }
        
    }
}
struct LoginVIew_Previews: PreviewProvider {
    static var previews: some View {
        LoginVIew()
    }
}
