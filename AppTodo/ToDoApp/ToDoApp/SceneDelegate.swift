//
//  SceneDelegate.swift
//  ToDoApp
//
//  Created by mikewang on 2020/1/26.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // 設置是否開啟音效
        let myUserDefaults = UserDefaults.standard
        var sound = 1
        if let soundOpen = myUserDefaults.object(forKey: "soundOpen") as? Int {
            sound = soundOpen
        }
        myUserDefaults.set(sound, forKey: "soundOpen")
        myUserDefaults.synchronize()

        // 設定導覽列預設底色
        UINavigationBar.appearance().barTintColor = UIColor.init(red: 0.83, green: 0.36, blue: 0.64, alpha: 1)
        
        // 設定導覽列預設按鈕顏色
        UINavigationBar.appearance().tintColor = UIColor.black
        
        // 建立一個 UIWindow
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // 設置底色
        self.window?.backgroundColor = UIColor.white
        
        // 設置根視圖控制器
        let nav = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = nav
        
        // 將 UIWindow 設置為可見的
        self.window?.makeKeyAndVisible()
        
        self.window?.windowScene = windowScene
        
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

