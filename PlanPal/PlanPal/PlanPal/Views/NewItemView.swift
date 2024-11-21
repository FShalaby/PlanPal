//
//  NewItemView.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack
            {
                Text("Add Task")
                    .font(.system(size: 32))
                    .padding(.top, 20)
                    .bold()
                
                Form
                {
                    
                    
                    TextField("Title", text: $viewModel.title)
                    DatePicker("Due Date", selection: $viewModel.dueDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                    ButtonView(title: "Add", background: Color.accent)
                    {
                        if viewModel.canSave
                        {
                            viewModel.save()
                            newItemPresented = false
                        }
                        else
                        {
                            viewModel.showAlert = true
                        }
                    }
                    .padding()
                    
                }
                .alert(isPresented: $viewModel.showAlert, content: {
                    Alert(title: Text("Error"), message: Text("Please Fill In All Fields And Select A Due Date That Is Today Or Newer"))
                })
                .scrollContentBackground(.hidden)
                .accentColor(Color.accent)
        }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
