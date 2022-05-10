//
//  Person+CoreDataProperties.swift
//  Core Data Demo
//
//  Created by Sunghee Bang on 2022-05-10.
//
//

import Foundation
import CoreData

// extension (provides extra code for the class), this file is created from xc and you shouldnt motify it - it will be out of sinc with definition in xc file
extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var gender: String?
    @NSManaged public var age: Int64
    @NSManaged public var array: [String]?

}

extension Person : Identifiable {

}
