//
//  PlanPalApp.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//
import FirebaseCore
import SwiftUI


@main
struct PlanPalApp: App {
    init()
    {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
