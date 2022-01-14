//
//  MainController.swift
//  Hark
//
//  Created by Andrey S on 11.01.2022.
//

import UIKit

class MainController: BaseController {
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    @IBOutlet weak var totalOnlineLabel: UILabel!
    
    @IBOutlet weak var totalWomenLabel: UILabel!
    @IBOutlet weak var totalMenLabel: UILabel!
    @IBOutlet weak var totalCommonLabel: UILabel!
    
    @IBOutlet weak var totalTalksLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = MainPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------

    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()

        setup()
    }
    
    //----------------------------------------------
    // MARK: - Setup
    //----------------------------------------------
    
    private func setup() {
        presenter.getOnlineStatistics()
        checkingStatistics()
    }
    
    private func checkingStatistics() {
        if let model = PreferencesManager.sharedManager.onlineStatistics {
            if let total = model.totalOnline?.roundedWithAbbreviations {
                totalOnlineLabel.text = "\(total) People"
            } else {
                totalOnlineLabel.text = "0 People"
            }
            
            if let total = model.totalWomen?.roundedWithAbbreviations {
                totalWomenLabel.text = total
            } else {
                totalWomenLabel.text = "0"
            }
            
            if let total = model.totalMen?.roundedWithAbbreviations {
                totalMenLabel.text = total
            } else {
                totalMenLabel.text = "0"
            }
            
            if let total = model.totalCommons?.roundedWithAbbreviations {
                totalCommonLabel.text = total
            } else {
                totalCommonLabel.text = "0"
            }
            
            if let total = model.totalInTalk?.roundedWithAbbreviationsSystem {
                let attrs1 = [NSAttributedString.Key.font : UIFont(name: "SFCompactRounded-Bold", size: 54.0)!, NSAttributedString.Key.foregroundColor : UIColor.white]
                let attrs2 = [NSAttributedString.Key.font :UIFont(name: "SFCompactRounded-Bold", size: 24.0)!, NSAttributedString.Key.foregroundColor : UIColor.white]

                let attributedString1 = NSMutableAttributedString(string: String(total.countNumber), attributes:attrs1)

                let attributedString2 = NSMutableAttributedString(string:total.systemMetrics ?? "", attributes:attrs2)

                attributedString1.append(attributedString2)
                totalTalksLabel.attributedText = attributedString1
            } else {
                totalTalksLabel.text = "0"
            }
        } else {
            totalOnlineLabel.text = ""
            
            totalWomenLabel.text = ""
            totalMenLabel.text = ""
            totalCommonLabel.text = ""
            
            totalTalksLabel.text = ""
        }
    }
}

//----------------------------------------------
// MARK: - MainOutputProtocol
//----------------------------------------------

extension MainController: MainOutputProtocol {
    func success() {
        checkingStatistics()
    }
}
