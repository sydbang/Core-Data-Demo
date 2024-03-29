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
    
//    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true), NSSortDescriptor(key: "age", ascending: true)],
//                  predicate: NSPredicate(format: "name contains[c] 'joe'"))
//    var people: FetchedResults<Person>
    
    @State var people = [Person]()
    @State var filterByText = ""
    
    @FetchRequest(sortDescriptors: []) var families: FetchedResults<Family>

    var body: some View {
        
        VStack {
            Button(action: addItem) {
                Label("Add Item", systemImage: "plus")
            }
            
            TextField("Filter Text", text: $filterByText)
//            { _ in
//                // Fetch new data
//                fetchData()
//            } // onEnditingChanged
                .border(Color.black, width: 1)
                .padding()
            
            List {
                
                ForEach(families) { family in
                    Text("\(family.name ?? "No Fam"), member count: \(family.members?.count ?? 0)")
                    
                }
                
                
//                ForEach(people) { person in
//                    Text("\(person.name ?? "No name") & age : \(person.stringage ?? "")")
//                        .onTapGesture {
//                            // Update
//                            person.name = "Joe"
//                            try! viewContext.save()
//
//                            // Delete
//                            //viewContext.delete(person)
//                            //try! viewContext.save()
//                        }
//                }
            }
        }
        .onChange(of: filterByText, perform: { value in
            fetchData()
        }) // to fetch data on every character pressed
        
        
        
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

    func fetchData() {
        // Create fetch request
        let request = Person.personFetchRequest()
        
        // Set sort descriptors and predicates
        request.sortDescriptors = [NSSortDescriptor(key: "age", ascending: true)]
        request.predicate = NSPredicate(format: "name contains %@", filterByText)
        
        // Execute the fetch
        DispatchQueue.main.async {
            do {
                let results = try viewContext.fetch(request)
                // Update the state property
                self.people = results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    
//    func sampleCode() {
//        let f = Family(context: viewContext)
//        f.name = "Collins Family"
//
//        let p = Person(context: viewContext)
//        p.family = f
//        // OR
//        // f.addToMembers(p)
//
//        // Save
//        try! viewContext.save()
//    }
//
    private func addItem() {
        
        let family = Family(context: viewContext)
        family.name = String("Family #\(Int.random(in: 0...20))")
        
        let numberOfMembers = Int.random(in:0...5)
        
        for _ in 0...numberOfMembers {
            let p = Person(context: viewContext) // you are creating a new person object and you are specifying that you want this data to be stored in core data
            p.age = Int64.random(in: 0...20)
            p.stringage = String(p.age)
            p.name = "Tom"
            p.family = family
        }
        
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
