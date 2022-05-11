//
//  ContentView.swift
//  Core Data Demo
//
//  Created by Sunghee Bang on 2022-05-10.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    // using property wrapper fetch request
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "age", ascending: true)]) var people: FetchedResults<Person>

    var body: some View {
        
        VStack {
            Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            }
            
            List {
                ForEach(people) { person in
                    Text("\(person.name ?? "No name") & age : \(person.stringage ?? "")")
                        .onTapGesture {
                            // Update
                            //person.name = "Joe"
                            //try! viewContext.save()
                            
                            // Delete
                            viewContext.delete(person)
                            try! viewContext.save()
                        }
                }
            }
        }
        
        
        
//        List {
//            ForEach(items) { item in
//                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//            }
//            .onDelete(perform: deleteItems)
//        }
//        .toolbar {
//            #if os(iOS)
//            EditButton()
//            #endif
//
//            Button(action: addItem) {
//                Label("Add Item", systemImage: "plus")
//            }
//        }
    }

    private func addItem() {
        
        let p = Person(context: viewContext) // you are creating a new person object and you are specifying that you want this data to be stored in core data
        p.age = Int64.random(in: 0...20)
        p.stringage = String(p.age)
        p.name = "Tom"
        
        // to actually save
        do {
            try viewContext.save()
        } catch {
            // Error with saving
        }
        
        
        
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
