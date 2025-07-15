//
//  WhatsappCloneApp.swift
//  WhatsappClone
//
//  Created by Raju Singh on 14/06/25.
//


import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct WhatsappCloneApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate


    var body: some Scene {
        WindowGroup {
//            LoginScreen()
            RootScreen()
        }
    }
}

