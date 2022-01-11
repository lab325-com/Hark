//
//  MainTabBarController.swift
//  Hark
//
//  Created by Andrey S on 06.01.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbarItemPlants = (self.tabBar.items?[0])! as UITabBarItem
        tabbarItemPlants.image = UIImage(named: "tab_bar_1_ic")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        tabbarItemPlants.selectedImage = UIImage(named: "tab_bar_1_selected_ic")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let tabbarItemGarden = (self.tabBar.items?[1])! as UITabBarItem
        tabbarItemGarden.image = UIImage(named: "tab_bar_2_ic")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        tabbarItemGarden.selectedImage = UIImage(named: "tab_bar_2_selected_ic")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let tabbarItemSchedule = (self.tabBar.items?[2])! as UITabBarItem
        tabbarItemSchedule.image = UIImage(named: "tab_bar_3_ic")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        tabbarItemSchedule.selectedImage = UIImage(named: "tab_bar_3_selected_ic")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        let tabbarItemMenu = (self.tabBar.items?[3])! as UITabBarItem
        tabbarItemMenu.image = UIImage(named: "tab_bar_4_ic")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        tabbarItemMenu.selectedImage = UIImage(named: "tab_bar_4_selected_ic")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        tabBar.layer.cornerRadius = 24
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        //tabBar.layer.masksToBounds = true
        //tabBar.layer.shadowOffset = CGSize(width: 0, height: 4)
        //tabBar.layer.shadowRadius = 30
        //tabBar.layer.shadowColor = UIColor(rgb: 0xA4E2AD).withAlphaComponent(0.5).cgColor
        //tabBar.layer.shadowOpacity = 1.0
    }
}
