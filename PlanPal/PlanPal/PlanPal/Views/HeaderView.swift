//
//  HeaderView.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import SwiftUI

struct HeaderView: View {
    let title:String
    let subtitle:String
    let angle:Double
    let background1:Color
    let background2:Color
    var body: some View {
        ZStack
        {
            Circle()
                .fill(LinearGradient(
                    gradient: .init(colors: [background1, background2]),
                    startPoint: .init(x: 0.6, y: 0),
                    endPoint: .init(x: 0.9, y: 0.8)))
                .offset(x:-120, y: -0)
                .shadow(color: .black, radius: 10)
                .rotationEffect(Angle(degrees: angle))
            
            Circle()
                .fill(LinearGradient(
                    gradient: .init(colors: [background1, background2]),
                    startPoint: .init(x: 1, y: 0),
                    endPoint: .init(x: 0.9, y: 0.7)))
                .offset(x:150, y:40)
                .shadow(color: .black, radius: 10)
                .foregroundColor(.blue)
                .rotationEffect(Angle(degrees: angle))
            VStack
            {
                Text(title)
                    .font(.system(size:50))
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.system(size:30))
                    .foregroundColor(.white)
                
            }
            .padding(.top, 30)
        }
        
        .frame(width: UIScreen.main.bounds.width*3, height: 310)
        .edgesIgnoringSafeArea(.all)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background1: .blue, background2: .purple)
    }
}
