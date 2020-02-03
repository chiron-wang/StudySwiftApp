//
//  SceneDelegate.swift
//  AppMoney
//
//  Created by mikewang on 2020/2/2.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit
import SQLite3

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var dbURL: URL = {
        do {
            return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("db.sqlite")
        } catch {
            fatalError("Error getting db URL document directory.")
        }
    }()


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 建立資料表
        let myUserDefaults = UserDefaults.standard
        let dbInit = myUserDefaults.object(forKey: "dbInit") as? Int
        if dbInit != nil {
            let db = SQLiteConnect(path: dbURL.path)
            if let myDB = db {
                let result = myDB.createTable("records", columnsInfo: [
                    "id integer primary key autoincrement",
                    "title text",
                    "amount double",
                    "yearMonth text",
                    "createDate text",
                    "createTime DateTime"
                ])
                
                if result {
                    myUserDefaults.set(1, forKey: "dbInit")
                    myUserDefaults.synchronize()
                }
            }
        }
        
        // 設置導覽列預設底色
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground()
        navBarAppearance.backgroundColor = UIColor(red: 1.0, green: 0.87, blue: 0.0, alpha: 1)
        
        // 設定導覽列預設按鈕顏色
        UINavigationBar.appearance().tintColor = .black
        
        // 設定 UITableViewCell 預設底色
        UITableViewCell.appearance().backgroundColor = UIColor(red: 0.03, green: 0.03, blue: 0.03, alpha: 1)
        
        // 建立根視圖控制器
        let navController = UINavigationController(rootViewController: ViewController())
        navController.navigationBar.standardAppearance = navBarAppearance
        navController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

