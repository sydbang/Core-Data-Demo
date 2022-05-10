//
//  TestFile.swift
//  Core Data Demo
//
//  Created by Sunghee Bang on 2022-05-10.
//

import Foundation

//let a = PersistenceController() // - triggers init method, cause loading of container etc.
// a.container

// "shared" exists a static property that creates an instance of persistenceController within the struct (property you can access without creating a new instance of it)

let b = PersistenceController.shared //returns the single instance of the persistence controller // called *singleton pattern* - you can access the same instance anywhere in your app
// Danger of using a singleton pattern is that it turns into a global variable ("shared" instance is not private - debugging becomes hard)

let a = PersistenceController.shared.container.viewContext

// .viewContext: The managed object context associated with the queue; type NSManagedObjectContext



// to work with core data we need:
// 1. You define your entities and attributes in the Core Data model
// 2. You generate your classes from the Core Data model.
// 3. You get a reference to the Core Dat persistence container
// 4. From the persistence container, you get a managed object context. Through that managed object context, you can create objects and store them in Core Data for retrieval for later use.




