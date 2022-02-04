//
//  MenuProfileController.swift
//  Hark
//
//  Created by Andrey S on 12.01.2022.
//

import UIKit
import SafariServices

class MenuProfileController: BaseController {
    
    @IBOutlet weak var shareAppButton: UIButton!
    @IBOutlet weak var rateAppButton: UIButton!
    @IBOutlet weak var tearmsConditionsButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    override func viewDidLoad() {
        setupBackButton = false
        super.viewDidLoad()
        
        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        setCustomNavigationTitle("Menu")
        let backButton = UIBarButtonItem(image: UIImage(named: "menu_close_ic"), style: .plain, target: self, action: #selector(actionClose))
        navigationItem.rightBarButtonItem = backButton
        
        shareAppButton.layer.cornerRadius = 6
        shareAppButton.layer.borderWidth = 1
        shareAppButton.layer.borderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1).cgColor
        
        rateAppButton.layer.cornerRadius = 6
        rateAppButton.layer.borderWidth = 1
        rateAppButton.layer.borderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1).cgColor
        
        tearmsConditionsButton.layer.cornerRadius = 6
        tearmsConditionsButton.layer.borderWidth = 1
        tearmsConditionsButton.layer.borderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1).cgColor
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @objc func actionClose() {
        dismiss(animated: true)
    }
    
    @IBAction func actionShareApp(_ sender: UIButton) {
        if let url = URL(string: "https://itunes.apple.com/us/app/hark/id1602488612?mt=8") {
            SharingManager.sharedManager.sendSharingLink(url: url, controller: self)
        }
    }
    
    @IBAction func actionRateApp(_ sender: UIButton) {
        if let url = URL(string: "itms-apps://itunes.apple.com/app/hark" + "id1602488612") { ///ID => 1586099684
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    @IBAction func actionTermsApp(_ sender: UIButton) {
        if let url = URL(string: "https://mob325.com/lill/privacy_policy.html") {
            let safariViewController = SFSafariViewController(url: url)
            safariViewController.modalPresentationStyle = .fullScreen
            safariViewController.preferredBarTintColor = .white
            safariViewController.preferredControlTintColor = UIColor(rgb: 0x7CDAA3)
            parent?.present(safariViewController, animated: true)
        }
    }
    
    @IBAction func actionLogOut(_ sender: UIButton) {
        let title = "Are you sure you want to Log Out?"
        let yesText = "Yes"
        let noText = "No"
        
        let alert = UIAlertController(title: "Hark", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: yesText, style: .default, handler: { action in
            ProfileRouter(presenter: self.navigationController).logOut()
        }))
        
        alert.addAction(UIAlertAction(title: noText, style: .cancel, handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func actionDeleteAccount(_ sender: UIButton) {
        let title = "Are you sure you want to Delete Account?"
        let yesText = "Yes"
        let noText = "No"
        
        let alert = UIAlertController(title: "Hark", message: title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: yesText, style: .default, handler: { action in
            ProfileRouter(presenter: self.navigationController).logOut()
        }))
        
        alert.addAction(UIAlertAction(title: noText, style: .cancel, handler: { action in
            
        }))
        
        self.present(alert, animated: true, completion: nil)

    }
    
}
