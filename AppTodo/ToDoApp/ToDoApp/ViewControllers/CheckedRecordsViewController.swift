//
//  CheckedRecordsViewController.swift
//  ToDoApp
//
//  Created by mikewang on 2020/1/26.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class CheckedRecordsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "已完成事項"
        self.automaticallyAdjustsScrollViewInsets = false
        checkStatus = true
        
        // 建立 UITableView
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: fullSize.width, height: fullSize.height - 64), style: .plain)
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.allowsSelection = true
        self.view.addSubview(myTableView)
    }
}
