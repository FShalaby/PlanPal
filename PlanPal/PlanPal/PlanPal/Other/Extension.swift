//
//  Extension.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import Foundation
import SwiftUI





extension Color {
    static let background = Color("background")
    static let accent = Color("accent")
    static let bubblegum = Color("bubblegum")
    static let buttercup = Color("buttercup")
    static let lavender = Color("lavender")
    static let periwinkle = Color("periwinkle")
    static let teal = Color("teal")
    static let tan = Color("tan")
    static let poppy = Color("poppy")
    static let orange = Color("orange")
    static let yellow = Color("yellow")
   
}


extension Encodable
{
    func asDictionary() -> [String:Any]
    {
        guard let data = try? JSONEncoder().encode(self) else
        {
            return [:]
        }
        
        do
        {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        }catch{
            return[:]
        }
    }
}
