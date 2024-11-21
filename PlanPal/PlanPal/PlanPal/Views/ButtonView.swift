//
//  ButtonView.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import SwiftUI

struct ButtonView: View {
    let title:String
    let background:Color
    let action:() -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack
            {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .bold()
                    .foregroundColor(.white)
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Value", background: .pink)
        {
            
        }
            .previewLayout(.fixed(width: 200, height: 40))
        
    }
}
