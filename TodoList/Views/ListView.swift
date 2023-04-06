//
//  SwiftUIView.swift
//  TodoList
//
//  Created by Grace Gong on 2023-04-03.
//

import SwiftUI

struct ListView: View {
    
    // MARK: Stored properties
    
    // The list of items to be completed
    @State var todoItems: [TodoItem] = existingTodoItems
    
    //The item currently being added
    @State var newItemDescription: String = ""
    
    // MARK: Computed properties
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    
                    TextField("Enter a to-do item", text: $newItemDescription)
                    
                    Button(action: {
                        
                        // Get last todo item id
                        let lastId = todoItems.last!.id
                        
                        //Create new todo item id
                        let newId = lastId + 1
                        
                        // Create the new todo item
                        let newTodoltem = TodoItem(id: newId,
                                                   description: newItemDescription,
                                                   completed: false)
                        
                        // Add the new to-do item to the list
                        todoItems.append (newTodoltem)
                        
                        // Clear the input field
                        newItemDescription = ""
                        
                    }, label: {
                        Text ("ADD")
                            .font (.caption)
                    })
                }
                .padding(20)
                
                
                
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
