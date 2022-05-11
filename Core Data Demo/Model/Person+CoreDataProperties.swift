//
//  Person+CoreDataProperties.swift
//  Core Data Demo
//
//  Created by Sunghee Bang on 2022-05-11.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func personFetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: Int64
    @NSManaged public var array: [String]?
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var stringage: String?
    @NSManaged public var family: Family?

}

extension Person : Identifiable {

}
