//
//  ProfileView.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.background.ignoresSafeArea()
                VStack
                {
                    if let user = viewModel.user
                    {
                        Image(systemName: "person.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(Color.accent)
                            .frame(width: 125, height: 125)
                            .padding()
                        VStack(alignment: .leading)
                        {
                            HStack
                            {
                                Text("Name:")
                                    .bold()
                                Text(user.name)
                            }
                            .padding()
                            HStack
                            {
                                Text("Email:")
                                    .bold()
                                Text(user.email)
                            }
                            .padding()
                            HStack
                            {
                                Text("Member Since:")
                                    .bold()
                                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                            }
                            .padding()
                        }
                        .padding()
                        Button("Log Out")
                        {
                            viewModel.logout()
                        }
                        .tint(Color.accent)
                        .padding()
                        
                        Spacer()
                    }
                    else
                    {
                        ProgressView("Loading Profile...")
                            .progressViewStyle(CircularProgressViewStyle(tint: Color.accent))
                                .scaleEffect(1.5)
                    }
            }
            .navigationTitle("Profile")
            }
            .onAppear
            {
                viewModel.fetchUser()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
