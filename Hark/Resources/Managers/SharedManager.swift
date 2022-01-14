//
//  SharedManager.swift
//  Hark
//
//  Created by Andrey S on 12.01.2022.
//

import UIKit

class SharingManager {
    private var currentController: UIViewController?
    
    static let sharedManager: SharingManager = {
        let sharedInstance = SharingManager()
        return sharedInstance
    }()
    
    func sendSharingLink(url objectsToShare: URL, controller: UIViewController) {
        currentController = controller
        let someText:String = ""
        let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,someText as AnyObject]
        let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = controller.view
        
        activityViewController.completionWithItemsHandler = { activity, completed, items, error in
            activityViewController.dismiss(animated: true)
            
        }
         
        controller.present(activityViewController, animated: true, completion: nil)
    }
}
