//
//  ContentView.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    @State private var showProfileView = false
    var body: some View {
       
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty
        {
            accountView
            
        }
        else
        {
            LoginVIew()
        }
    }
    
    @ViewBuilder
    var accountView: some View
    {
        TabView{
            ToDoListView(userId:viewModel.currentUserId )
                .tabItem
            {
                Label("Home", systemImage: "house")
                   
                    
            }
            
            ProfileView()
                .tabItem
            {
                Label("Profile", systemImage: "person.circle")
                   
                    
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
