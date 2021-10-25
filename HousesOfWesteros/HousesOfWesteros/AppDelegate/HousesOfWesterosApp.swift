//
//  HousesOfWesterosApp.swift
//  Houses of Westeros
//
//  Created by Matthias Zarzecki on 13.04.21.
//

import BackgroundTasks
import SwiftUI

@main
struct HousesOfWesterosApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  var body: some Scene {
    WindowGroup {
      BaseView()
    }
  }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    BGTaskScheduler.shared.register(
      forTaskWithIdentifier: "com.matthiaszarzecki.HousesOfWesteros.backgroundRefresh",
      using: nil
    ) { task in
         //self.handleAppRefresh(task: task as! BGAppRefreshTask)
    }

    return true
  }
}
