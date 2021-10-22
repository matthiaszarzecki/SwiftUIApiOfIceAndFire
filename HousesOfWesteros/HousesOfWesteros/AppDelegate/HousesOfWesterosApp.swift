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
         self.handleAppRefresh(task: task as! BGAppRefreshTask)
    }

    return true
  }

  func scheduleAppRefresh() {
     let request = BGAppRefreshTaskRequest(identifier: "com.matthiaszarzecki.HousesOfWesteros.backgroundRefresh")
     // Fetch no earlier than 15 minutes from now.
     request.earliestBeginDate = Date(timeIntervalSinceNow: 15 * 60)

     do {
        try BGTaskScheduler.shared.submit(request)
     } catch {
        print("Could not schedule app refresh: \(error)")
     }
  }

  func handleAppRefresh(task: BGAppRefreshTask) {
     // Schedule a new refresh task.
     scheduleAppRefresh()

     // Create an operation that performs the main part of the background task.
     let operation = refreshAppContentsOperation()

     // Provide the background task with an expiration handler that cancels the operation.
     task.expirationHandler = {
        operation.cancel()
     }

     // Inform the system that the background task is complete
     // when the operation completes.
     operation.completionBlock = {
        task.setTaskCompleted(success: !operation.isCancelled)
     }

     // Start the operation.
     operationQueue.addOperation(operation)
   }

  func refreshAppContentsOperation() {
    print("### Hello ###")
  }
}
