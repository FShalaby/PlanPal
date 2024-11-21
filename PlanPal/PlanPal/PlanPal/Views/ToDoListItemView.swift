//
//  ToDoListItemView.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
   
    let item: ToDoListItem

    var body: some View {
        
            
        ZStack {
            RoundedRectangle(cornerRadius: 15)
//                .fill(colors[randomColorIndex])
                .fill(Color.accent)
               

            HStack {
                   
                    VStack(alignment:.leading)
                    {
                        Text(item.title)
                            .font(.body)
                            .padding(.leading,15)
                            .padding(.top, 5)
                            
                        
                        Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                            .font(.footnote)
                            .foregroundColor(Color(.secondaryLabel))
                            .padding(.leading,20)
                            .padding(.bottom, 5)
                            
                        
                }
                    Spacer()
                    
                    Button{
                        viewModel.toggleisDone(item: item)
                            
                    }label: {
                        Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    }
                
              
                    .padding(.trailing,20)
                   
                    .foregroundColor(Color.background)
            }
           
        }
            
            
        
      
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123", title: "Buy Eggs", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
            .previewLayout(.fixed(width: 400, height:100))
    }
}
