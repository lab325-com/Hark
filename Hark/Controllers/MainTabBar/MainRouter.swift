//
//  MainRouter.swift
//  Hark
//
//  Created by Andrey S on 25.01.2022.
//

import UIKit

class MainRouter: BaseRouter {
    func presentMainGo(tabBarController: UITabBarController?, delegate: MainGoSearchDelegate, talkId: String) {
        let controller = MainGoSearchController(delegate: delegate, talkId: talkId)
        controller.modalTransitionStyle = .crossDissolve
        controller.modalPresentationStyle = .overCurrentContext
        tabBarController?.present(controller, animated: true, completion: nil)
    }
}
