//
//  ViewController.swift
//  ExCoreData
//
//  Created by mikewang on 2020/1/23.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myEntityName = "Student"
        let myContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let coreDataConnect = CoreDataConnect(context: myContext)
        
        // auto increment
        let myUserDefaults = UserDefaults.standard
        var seq = 1
        if let isSeq = myUserDefaults.object(forKey: "isSeq") as? Int {
            seq = isSeq + 1
        }
        
        // insert
        let insertResult = coreDataConnect.insert(myEntityName, attributeInfo: [
            "id": "\(seq)",
            "name": "麥克\(seq)",
            "height": "\(176.5 + Double(seq))"
        ])
        
        if insertResult {
            print("新增資料成功")
            
            myUserDefaults.set(seq, forKey: "idSeq")
            myUserDefaults.synchronize()
        }
        
        // select
        let selectResult = coreDataConnect.retrieve(myEntityName, predicate: nil, sort: [["id":true]], limit: nil)
        if let results = selectResult {
            for result in results {
                print("\(result.value(forKey: "id")!). \(result.value(forKey: "name")!)")
                print("身高： \(result.value(forKey: "height")!)")
            }
        }
        
        // update
        let updateId = seq - 1
        var predicate = "id = \(updateId)"
        let updateResult = coreDataConnect.update(myEntityName, predicate: predicate, attributeInfo: ["height":"\(seq * 10)"])
        
        if updateResult {
            print("更新資料成功")
        }
        
        // delete
        let deleteId = seq - 2
        predicate = "id = \(deleteId)"
        let deleteResult = coreDataConnect.delete(myEntityName, predicate: predicate)
        
        if deleteResult {
            print("刪除資料成功")
        }
    }

}
