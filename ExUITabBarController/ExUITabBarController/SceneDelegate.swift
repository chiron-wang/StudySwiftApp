//
//  SceneDelegate.swift
//  ExUITabBarController
//
//  Created by mikewang on 2020/1/22.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // 設定背景顏色為白色
        window?.backgroundColor = .white
        
        // 建立 UITabBarController
        let myTabBar = UITabBarController()
        
        // 設置標籤列
        // 使用 UITabBarController 的屬性 tabBar 的各個屬性設置
        myTabBar.tabBar.backgroundColor = .clear
        
        // 建立頁面 使用系統圖示
        let mainViewController = ViewController()
        mainViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 100)
        
        // 建立頁面 使用自定義圖示 有預設圖片及按下圖片
        let articleViewController = ArticleViewController()
        articleViewController.tabBarItem = UITabBarItem(title: "文章", image: UIImage(named: "article"), selectedImage: UIImage(named: "articleSelected"))
        
        // 建立頁面 使用自定義圖示 只有預設圖片
        let introViewController = IntroViewController()
        introViewController.tabBarItem = UITabBarItem(title: "介紹", image: UIImage(named: "profile"), tag: 200)
        
        // 建立頁面 使用自定義圖示 可使用 tabBarItem 的屬性各自設定
        let settingViewController = SettingViewController()
        settingViewController.tabBarItem.image = UIImage(named: "setting")
        settingViewController.tabBarItem.title = "設定"
        
        // 加入到 UITabBarController
        myTabBar.viewControllers = [
            mainViewController,
            articleViewController,
            introViewController,
            settingViewController
        ]
        
        // 預設開啟的頁面 (從 0 開始算起)
        myTabBar.selectedIndex = 0
        
        // 設置根視圖控制器
        window?.rootViewController = myTabBar
        
        // 將 UIWindow 設置為可見的
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

