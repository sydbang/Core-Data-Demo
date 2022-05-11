//
//  Family+CoreDataProperties.swift
//  Core Data Demo
//
//  Created by Sunghee Bang on 2022-05-11.
//
//

import Foundation
import CoreData


extension Family {

    @nonobjc public class func familyFetchRequest() -> NSFetchRequest<Family> {
        return NSFetchRequest<Family>(entityName: "Family")
    }

    @NSManaged public var name: String?
    @NSManaged public var members: NSSet? // collection type that can only store unique objects and is not sorted

}

// MARK: Generated accessors for members
extension Family {

    @objc(addMembersObject:)
    @NSManaged public func addToMembers(_ value: Person)

    @objc(removeMembersObject:)
    @NSManaged public func removeFromMembers(_ value: Person)

    @objc(addMembers:)
    @NSManaged public func addToMembers(_ values: NSSet)

    @objc(removeMembers:)
    @NSManaged public func removeFromMembers(_ values: NSSet)

}

extension Family : Identifiable {

}
