//
//  User.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import Foundation

struct User: Codable
{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
