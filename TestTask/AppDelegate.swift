//
//  AppDelegate.swift
//  TestTask
//
//  Created by Ilya Lapan on 14/12/2016.
//  Copyright © 2016 ilyalapan. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplicationBackgroundFetchIntervalMinimum)
        return true
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        if let navController = window?.rootViewController as? UINavigationController {
            for viewController in navController.childViewControllers {
                if let productListController = viewController as? ProductListTableViewController {
                    let previousProducts = productListController.manager.products[0]
                    productListController.manager.load(){_ in
                        
                        var new = Product.subtractArraysOfProdcuts(firstArray: productListController.manager.products[0],secondArray: previousProducts)
                        
                        let content = UNMutableNotificationContent()
                        if new.count == 0 {
                            completionHandler(UIBackgroundFetchResult.noData)
                            return
                        }
                        else if new.count == 1{
                            content.title = "New Product"
                            content.subtitle = "A new product:" + new[0].name
                            content.body = new[0].tagline
                            content.categoryIdentifier = "message"
                        } else {
                            content.title = "New Products"
                            content.subtitle = String(new.count) + "new products"
                            content.body = ""
                            content.categoryIdentifier = "message"
                        }
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1.0, repeats: false)
                        let request = UNNotificationRequest(identifier: "10.second.message", content: content, trigger: trigger)
                        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                        
                        productListController.tableView.reloadData()
                        completionHandler(UIBackgroundFetchResult.newData)

                    }
                }
            }
        }
    }
    
   
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

