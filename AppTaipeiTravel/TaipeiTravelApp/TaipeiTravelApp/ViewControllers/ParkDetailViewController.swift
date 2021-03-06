//
//  ParkDetailViewController.swift
//  TaipeiTravelApp
//
//  Created by mikewang on 2020/1/31.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class ParkDetailViewController: DetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchType = "park"
        
        let latitude = info["latitude"] as? Double ?? 0.0
        let longitude = info["longitude"] as? Double ?? 0.0
        hasMap = latitude == 0.0 && longitude == 0.0 ? false : true
        
        // 設置資訊
        detail = [
            "地圖",
            info["type"] as? String ?? "",
            info["location"] as? String ?? "",
            info["area"] as? String ?? "",
            info["intro"] as? String ?? ""
        ]
        
        self.title = info["title"] as? String ?? "標題"
    }
    
    //  MARK: - UITableViewDelegate Methods
    
    // 必須實作的方法：每一組有幾個 cell
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hasMap ? 5 : 4
    }
    
}
