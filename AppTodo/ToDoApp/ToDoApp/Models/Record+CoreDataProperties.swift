//
//  Record+CoreDataProperties.swift
//  ToDoApp
//
//  Created by mikewang on 2020/1/28.
//  Copyright © 2020 mikewang. All rights reserved.
//
//

import Foundation
import CoreData


extension Record {

//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Record> {
//        return NSFetchRequest<Record>(entityName: "Record")
//    }

    @NSManaged public var content: String?
    @NSManaged public var done: NSNumber?
    @NSManaged public var id: NSNumber?
    @NSManaged public var seq: NSNumber?

}
