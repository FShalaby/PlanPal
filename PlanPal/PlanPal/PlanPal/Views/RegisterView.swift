//
//  RegisterView.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var registerModel = RegisterViewViewModel()
    var body: some View {
        VStack
        {
            HeaderView(title: "Register", subtitle: "Take Control of Your Tasks", angle: -50, background1: .orange, background2: .red)
            Form
            {
                TextField("Full Name", text: $registerModel.name)
                    .autocorrectionDisabled()
                TextField("Email", text: $registerModel.email)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                SecureField("Password", text: $registerModel.password)
                
                ButtonView(title: "Create Account", background: .green)
                {
                    registerModel.register()
                }
                .padding()
            }
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
