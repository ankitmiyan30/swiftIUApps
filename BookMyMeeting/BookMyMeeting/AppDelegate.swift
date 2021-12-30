//
//  AppDelegate.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 22/09/20.
//

import UIKit
import Firebase
import GoogleSignIn
import IQKeyboardManagerSwift
@main
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.shared.enable = true
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = "927271722770-r0cloour88rja12ivug5t8efqci252in.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate =  self
        checkCurrentUser()
        return true
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        let nav = UINavigationController(rootViewController: homeViewController)
        let window = UIApplication.shared.windows.first!
        window.rootViewController = nav
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ((GIDSignIn.sharedInstance()?.handle(url)) != nil)
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate {
    func checkCurrentUser(){
        
    }
    
}
