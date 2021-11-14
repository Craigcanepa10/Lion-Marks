//
//  Lion_MarksApp.swift
//  Lion Marks
//
//  Created by Craig Canepa on 10/19/21.
//

import SwiftUI
import GoogleMaps
import GooglePlaces

let APIKey = "AIzaSyByxsMkD9n0tvzih3Gx_qoBoBl3kglqPOo"

@main
struct Lion_MarksApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate    {
     func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
         GMSServices.provideAPIKey(APIKey)
         GMSPlacesClient.provideAPIKey(APIKey)
         return true
     }
 }
