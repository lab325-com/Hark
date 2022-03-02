
import UIKit
import PushKit
import FBSDKCoreKit
import Firebase
import AppsFlyerLib
import AppTrackingTransparency

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //Firebase analytics
        
        FirebaseApp.configure()
                
        //Facebook analytics
        
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        Settings.shared.clientToken = "fcd711f877d11d40f74c0122995ff36e"
        AppEvents.shared.activateApp()
        
        if #available(iOS 14, *) {
            if ATTrackingManager.trackingAuthorizationStatus == .authorized {
                Settings.shared.isAdvertiserIDCollectionEnabled = true
                Settings.shared.isAdvertiserTrackingEnabled = true
            } else {
                Settings.shared.isAdvertiserIDCollectionEnabled = false
                Settings.shared.isAdvertiserTrackingEnabled = false
            }
        }
        
        //AppsFlyer analytics
        
        AppsFlyerLib.shared().appsFlyerDevKey = "sapALRVCHUnGS6xNLJQPjS"
        AppsFlyerLib.shared().appleAppID = "1602488612"
        AppsFlyerLib.shared().delegate = self
        AppsFlyerLib.shared().useUninstallSandbox = true
        
        if !isAppAlreadyLaunchedOnce() {
            AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_first_open)
        }
        
        AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_session_start)
        
        return RootRouter.sharedInstance.application(didFinishLaunchingWithOptions: launchOptions as [UIApplication.LaunchOptionsKey: Any]?, window: window ?? UIWindow(frame: UIScreen.main.bounds))
    }
    
    func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
        if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce") {
            return true
        } else {
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            return false
        }
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        AppsFlyerLib.shared().handleOpen(url, options: options)
        
        ApplicationDelegate.shared.application(app,
                                               open: url,
                                               sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                               annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        
        return true
    }
}

//----------------------------------------------
// MARK: - AppsFlyerLibDelegate
//----------------------------------------------

extension AppDelegate: AppsFlyerLibDelegate {
    
    func onConversionDataSuccess(_ data: [AnyHashable: Any]) {
        print("onConversionDataSuccess data:")
        
        for (key, value) in data {
            print(key, ":", value)
        }
        
        if let status = data["af_status"] as? String {
            if (status == "Non-organic") {
                if let sourceID = data["media_source"],
                   let campaign = data["campaign"] {
                    print("This is a Non-Organic install. Media source: \(sourceID)  Campaign: \(campaign)")
                }
            } else {
                print("This is an organic install.")
            }
            if let is_first_launch = data["is_first_launch"] as? Bool,
               is_first_launch {
                print("First Launch")
            } else {
                print("Not First Launch")
            }
        }
    }
    
    func onConversionDataFail(_ error: Error) {
        print("\(error)")
    }
    
    func onAppOpenAttribution(_ attributionData: [AnyHashable: Any]) {
        print("onAppOpenAttribution data:")
        for (key, value) in attributionData {
            print(key, ":",value)
        }
    }
    
    func onAppOpenAttributionFailure(_ error: Error) {
        print("\(error)")
    }
}
