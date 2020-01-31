//
//  SceneDelegate.swift
//  TaipeiTravelApp
//
//  Created by mikewang on 2020/1/30.
//  Copyright © 2020 mikewang. All rights reserved.
//

import UIKit
import CoreLocation

class SceneDelegate: UIResponder, UIWindowSceneDelegate, CLLocationManagerDelegate {

    var window: UIWindow?
    var myLocationManager: CLLocationManager!
    var myUserDefaults: UserDefaults!


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // 取得儲存的預設資料
        self.myUserDefaults = UserDefaults.standard
        
        // 建立一個 CLLocationManager
        myLocationManager = CLLocationManager()
        myLocationManager.delegate = self
        myLocationManager.distanceFilter = kCLLocationAccuracyHundredMeters
        myLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        // 首次使用 向使用者詢問定位自身位置權限
        if CLLocationManager.authorizationStatus() == .notDetermined {
            // 取得定位服務授權
            myLocationManager.requestWhenInUseAuthorization()
            
            // 設定後的動作請至委任方法
            // func locationManager(
            //   manager: CLLocationManager,
            //   didChangeAuthorizationStatus status: CLAuthorizationStatus)
            // 設置
        } else if CLLocationManager.authorizationStatus() == .denied {
            // 設置定位權限的紀錄
            self.myUserDefaults.set(false, forKey: "locationAuth")
            
            self.myUserDefaults.synchronize()
        } else if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            // 設置定位權限的紀錄
            self.myUserDefaults.set(true, forKey: "locationAuth")
            
            // 更新記錄的座標 for 取得有限數量的資料
            for type in ["hotel", "landmark", "park", "toilet"] {
                self.myUserDefaults.set(0.0, forKey: "\(type)RecordLatitude")
                self.myUserDefaults.set(0.0, forKey: "\(type)RecordLongitude")
            }
            
            self.myUserDefaults.synchronize()
        }
        
        // 設置導覽列預設底色
        let navBarAppearance = UINavigationBarAppearance()
        // This only set top status bar as transparent, not the nav bar.
        navBarAppearance .configureWithTransparentBackground()
        // This set the color for both status bar and nav bar(alpha 1).
        navBarAppearance.backgroundColor = UIColor(red: 0.24, green: 0.79, blue: 0.83, alpha: 1)
//        navigationController?.navigationBar.standardAppearance = navBarAppearance
//        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
//        // Nav bar need sets to translucent for both nav bar and status bar to be translucent.
//        navigationController?.navigationBar.isTranslucent = true
//        // // Need to reset nav bar's color to make it clear to display navBarAppearance's color
//        navigationController?.navigationBar.backgroundColor = UIColor.clear
        
//        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.24, green: 0.79, blue: 0.83, alpha: 1)
        
        // 設定導覽列預設按鈕顏色
        UINavigationBar.appearance().tintColor = .black
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // 建立 UITabBarController
        let myTabBar = UITabBarController()
        
        // 建立 景點 頁面
        let landmarkViewController = UINavigationController(rootViewController: LandmarkMainViewController())
        landmarkViewController.tabBarItem = UITabBarItem(title: "景點", image: UIImage(named: "landmark"), tag: 200)
        landmarkViewController.navigationBar.standardAppearance = navBarAppearance
        landmarkViewController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        // 建立 公園 頁面
        let parkViewController = UINavigationController(rootViewController: ParkMainViewController())
        parkViewController.tabBarItem = UITabBarItem(title: "公園", image: UIImage(named: "park"), tag: 300)
        parkViewController.navigationBar.standardAppearance = navBarAppearance
        parkViewController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        // 建立 廁所 頁面
        let toiletViewController = UINavigationController(rootViewController: ToiletMainViewController())
        toiletViewController.tabBarItem = UITabBarItem(title: "廁所", image: UIImage(named: "toilet"), tag: 400)
        toiletViewController.navigationBar.standardAppearance = navBarAppearance
        toiletViewController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        // 建立 住宿 頁面
        let hotelViewController = UINavigationController(rootViewController: HotelMainViewController())
        hotelViewController.tabBarItem = UITabBarItem(title: "住宿", image: UIImage(named: "hotel"), tag: 100)
        hotelViewController.navigationBar.standardAppearance = navBarAppearance
        hotelViewController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        // 建立 關於 頁面
        let infoViewController = UINavigationController(rootViewController: InfoMainViewController())
        infoViewController.tabBarItem = UITabBarItem(title: "關於", image: UIImage(named: "info"), tag: 500)
        infoViewController.navigationBar.standardAppearance = navBarAppearance
        infoViewController.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        // 加入到 UITabBarController
        myTabBar.viewControllers = [landmarkViewController, parkViewController, toiletViewController, hotelViewController, infoViewController]
        
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
    
    // MARK: - CLLocationManagerDelegate Methods
    
    // 更改定位權限時執行
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.denied {
            // 提示可至[設定]中開啟權限
            let alertController = UIAlertController(title: "定位服務已關閉", message: "如要變更權限，請至 設定 > 隱私權 > 定位服務 開啟", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確認", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.window?.rootViewController?.present(alertController, animated: true, completion: nil)
            
            // 設置定位權限的記錄
            self.myUserDefaults.set(false, forKey: "locationAuth")
            self.myUserDefaults.synchronize()
        } else if status == CLAuthorizationStatus.authorizedWhenInUse {
            // 設置定位權限的記錄
            self.myUserDefaults.set(true, forKey: "locationAuth")
            self.myUserDefaults.synchronize()
        }
    }

}
