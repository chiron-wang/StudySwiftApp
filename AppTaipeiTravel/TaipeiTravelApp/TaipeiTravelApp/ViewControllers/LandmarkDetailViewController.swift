//
//  LandmarkDetailViewController.swift
//  TaipeiTravelApp
//
//  Created by mikewang on 2020/1/31.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class LandmarkDetailViewController: DetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchType = "landmark"
        
        let latitude = info["latitude"] as? Double ?? 0.0
        let longitude = info["longitude"] as? Double ?? 0.0
        hasMap = latitude == 0.0 && longitude == 0.0 ? false : true
        
        // 設置資訊
        detail = [
            "地圖",
            info["type"] as? String ?? "",
            info["address"] as? String ?? "",
            info["openTime"] as? String ?? "",
            info["transportation"] as? String ?? "",
            info["intro"] as? String ?? ""
        ]
        
        self.title = info["title"] as? String ?? "標題"
    }
    
}
