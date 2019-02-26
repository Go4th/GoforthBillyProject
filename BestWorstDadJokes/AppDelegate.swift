//
//  AppDelegate.swift
//  BestWorstDadJokes
//
//  Created by Student on 2/5/19.
//  Copyright © 2019 BGoforth. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Use Firebase library to configure APIs
//        FirebaseApp.configure()
//        var ref: DatabaseReference!
//
//        ref = Database.database().reference()
//
//        let db = Database.database().reference().child("jokes").queryOrdered(byChild: "PostUser")
//        db.observe(.value, with:{ (snapshot: DataSnapshot) in
//            for snap in snapshot.children {
//                print((snap as! DataSnapshot).value)
////                var name = snap.value("PostUser")
//                
//
//            }
//        })
//        ref.child("jokes").observeSingleEvent(of: .value , with: {(snapshot) in
//                let value = snapshot.value as? NSDictionary
//            print(value)
//            let joke1 = value?[0]
//            print(joke1)
////            print(user)
//        })
//        
//            ref.observe(.value, with: { (snapshot) in
//                for child in snapshot.children { //even though there is only 1 child
//                    let snap = child as! DataSnapshot
//                    let dict = snap.value as? NSDictionary
//                    for (joke, item) in dict ?? [:] {
////                        let userName = joke["PostUser"] as? String
//                        print(joke)
//                        print(item)
//                        
//                        
//                       
//                      
//                    }
////                    let name = dict?["PostUser"] as? String ?? ""
////                    let setup = dict?["Setup"] as? String ?? ""
////                    print(name, setup)
//                }
//            })
        // Override point for customization after application launch.
//        let authUI = FUIAuth.defaultAuthUI()
//        // You need to adopt a FUIAuthDelegate protocol to receive callback
//        authUI?.delegate = self as? FUIAuthDelegate
//        let providers: [FUIAuthProvider] = [
//            FUIGoogleAuth()
//        ]
//        authUI?.providers = providers
//
//        let authViewController = authUI?.authViewController()
        
        
        return true
    }
//    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
//        // handle user and error as necessary
//        print(error)
//    }
//    private func application(_ app: UIApplication, open url: URL,
//                             options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
//        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
//        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
//            return true
//        }
//        // other URL handling goes here.
//        return false
//    }
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

