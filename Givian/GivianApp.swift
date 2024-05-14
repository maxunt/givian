//
//  GivianApp.swift
//  Givian
//
//  Created by Max U on 4/28/24.
//

import SwiftUI
import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore


// Adding app delegate based on this post https://peterfriese.dev/blog/2020/swiftui-new-app-lifecycle-firebase/
// Which I got from this https://firebase.google.com/docs/ios/learn-more#swiftui
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct GivianApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//    init() {
//        FirebaseApp.configure()
//    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
