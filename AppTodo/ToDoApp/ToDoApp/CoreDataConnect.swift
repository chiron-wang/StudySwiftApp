//
//  CoreDataConnect.swift
//  ToDoApp
//
//  Created by mikewang on 2020/1/26.
//  Copyright © 2020 mikewang. All rights reserved.
//

import Foundation
import CoreData

class CoreDataConnect {
    var myContext: NSManagedObjectContext! = nil
    
    init(context: NSManagedObjectContext) {
        self.myContext = context
    }
    
    // insert
    func insert(_ myEntityName: String, attributeInfo: [String:String]) -> Bool {
        let insertData = NSEntityDescription.insertNewObject(forEntityName: myEntityName, into: myContext)
        
        for (key, value) in attributeInfo {
            let t = insertData.entity.attributesByName[key]?.attributeType
            
            if t == .integer16AttributeType || t == .integer32AttributeType || t == .integer64AttributeType {
                insertData.setValue(Int(value), forKey: key)
            } else if t == .doubleAttributeType || t == .floatAttributeType {
                insertData.setValue(Double(value), forKey: key)
            } else if t == .booleanAttributeType {
                insertData.setValue((value == "true" ? true : false), forKey: key)
            } else {
                insertData.setValue(value, forKey: key)
            }
        }
        
        do {
            try myContext.save()
            
            return true
        } catch {
            fatalError("\(error)")
        }
    }
    
    // retrieve
    func retrieve(_ myEntityName: String, predicate: String?, sort: [[String:Bool]]?, limit: Int?) -> [NSManagedObject]? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: myEntityName)
        
        // predicate
        if let myPredicate = predicate {
            request.predicate = NSPredicate(format: myPredicate)
        }
        
        // sort
        if let mySort = sort {
            var sortArr :[NSSortDescriptor] = []
            for sortCond in mySort {
                for (k, v) in sortCond {
                    sortArr.append(NSSortDescriptor(key: k, ascending: v))
                }
            }
            
            request.sortDescriptors = sortArr
        }
        
        // limit
        if let limitNumber = limit {
            request.fetchLimit = limitNumber
        }
        
        do {
            return try myContext.fetch(request) as? [NSManagedObject]
            
        } catch {
            fatalError("\(error)")
        }
    }
    
    // update
    func update(_ myEntityName: String, predicate: String?, attributeInfo: [String:String]) -> Bool {
        if let results = self.retrieve(myEntityName, predicate: predicate, sort: nil, limit: nil) {
            for result in results {
                for (key,value) in attributeInfo {
                    let t = result.entity.attributesByName[key]?.attributeType
                    
                    if t == .integer16AttributeType || t == .integer32AttributeType || t == .integer64AttributeType {
                        result.setValue(Int(value), forKey: key)
                    } else if t == .doubleAttributeType || t == .floatAttributeType {
                        result.setValue(Double(value), forKey: key)
                    } else if t == .booleanAttributeType {
                        result.setValue((value == "true" ? true : false), forKey: key)
                    } else {
                        result.setValue(value, forKey: key)
                    }
                }
            }
            
            do {
                try myContext.save()
                
                return true
            } catch {
                fatalError("\(error)")
            }
        }
        
        return false
    }
    
    // delete
    func delete(_ myEntityName: String, predicate: String?) -> Bool {
        if let results = self.retrieve(myEntityName, predicate: predicate, sort: nil, limit: nil) {
            for result in results {
                myContext.delete(result)
            }
            
            do {
                try myContext.save()
                
                return true
            } catch {
                fatalError("\(error)")
            }
        }
        
        return false
    }
}
