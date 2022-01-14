//
//  ProfileRoute.swift
//  Hark
//
//  Created by Andrey S on 12.01.2022.
//

import Foundation

class ProfileRouter: BaseRouter {
    func presentMenu() {
        let controller = MenuProfileController()
        let nc = NavigationController(rootViewController: controller)
        present(controller: nc)
    }
    
    func logOut() {
        KeychainService.standard.removeAll()
        RootRouter.sharedInstance.loadLogin(toWindow: RootRouter.sharedInstance.window!)
    }
}
