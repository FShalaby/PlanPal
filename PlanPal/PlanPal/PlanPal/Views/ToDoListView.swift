//
//  ToDoListView.swift
//  PlanPal
//
//  Created by Fouad Shalaby on 2023-09-18.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel

    @FirestoreQuery var items: [ToDoListItem]
   
    
    init(userId: String)
    {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/Tasks")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationView {
            ZStack
            {
                Color.background.ignoresSafeArea()
                
                VStack
                {
                    
                    List{
                        
                        ForEach(items.indices, id: \.self) { index in
                            if !items[index].isDone {
                                ToDoListItemView(item: items[index])
                                    .swipeActions {
                                        Button("Delete") {
                                            viewModel.delete(id: items[index].id)
                                        }
                                        .tint(Color.red)
                                    }
                                    .listRowBackground(Color.clear)
                                    .listRowSeparator(.hidden)
                            }
                        }
                    }
                    .listStyle(.plain)
                    .cornerRadius(20)
                }
                .navigationTitle("Task List")
                .toolbar
                {
                    Button{
                        viewModel.showingNewItemView = true
                    }label: {
                        Image(systemName: "plus.circle.fill")
                    }
                    .accentColor(Color.accent)
                }
                .sheet(isPresented:$viewModel.showingNewItemView)
                {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
            }
            
            
           
        }
        
      
        
        
        
        
    }
    
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "JfNsoJFFOBSxJO7UYp1Ynq61tIs2")
    }
}
