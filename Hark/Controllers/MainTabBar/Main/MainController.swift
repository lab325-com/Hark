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
    
    @IBOutlet weak var mainCountImageView: UIImageView!
    @IBOutlet weak var countsStackView: UIStackView!
    @IBOutlet weak var searchingImageView: UIImageView!
    @IBOutlet weak var inTalksLAbel: UILabel!
    
    @IBOutlet weak var startSearchButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = MainPresenter(view: self)
    private var isStartSearch = false
    private var startMathModel: StartMatchingModel?
    
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
        updateStartSearch(false)
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
    
    private func updateStartSearch(_ search: Bool) {
        UIView.animate(withDuration: 0.3) {
            self.totalTalksLabel.alpha = search ? 0.0 : 1.0
            self.mainCountImageView.alpha = search ? 0.0 : 1.0
            self.countsStackView.alpha = search ? 0.0 : 1.0
            self.inTalksLAbel.alpha = search ? 0.0 : 1.0
        
            self.searchingImageView.alpha = search ? 1.0 : 0.0
        
            self.startSearchButton.setTitle(search ? "Stop search" : "Start Search", for: .normal)
            self.startSearchButton.backgroundColor = search ? UIColor(rgb: 0x191919) : UIColor(rgb: 0x3CDBBE)
            self.startSearchButton.setTitleColor(search ? UIColor.white : UIColor.black, for: .normal)
        }
    }
    
    //----------------------------------------------
    // MARK: - IBActionк
    //----------------------------------------------
    
    @IBAction func actionStartSearch(_ sender: UIButton) {
        isStartSearch = !isStartSearch
        updateStartSearch(isStartSearch)

        if isStartSearch {
            presenter.subscribeStartMath()
        } else {
            presenter.unsubscribeStartMath()
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
    
    func successStartMath(model: StartMatchingModel) {
        startMathModel = model
        presenter.subscribeTalkId(talkId: model.startMatching.talkId)
        MainRouter(presenter: navigationController).presentMainGo(tabBarController: tabBarController, delegate: self, talkId: model.startMatching.talkId)
    }
    
    func successTalkID() {
        dismiss(animated: true)
        isStartSearch = !isStartSearch
        updateStartSearch(isStartSearch)
    }
}

//----------------------------------------------
// MARK: - MainGoSearchDelegate
//----------------------------------------------

extension MainController: MainGoSearchDelegate {
    func mainGoCancel(controller: MainGoSearchController) {
//        isStartSearch = !isStartSearch
//        updateStartSearch(isStartSearch)
    }
    
    func mainGoSuccess(controller: MainGoSearchController) {
        dismiss(animated: false) {
            HarkListRouter(presenter: self.navigationController).presentCall(model: nil, delegate: self, token: self.startMathModel?.startMatching.token, chanelID: self.startMathModel?.startMatching.channelName, uid: self.startMathModel?.startMatching.uid)
        }
    }
}

//----------------------------------------------
// MARK: - CallControllerDelegate
//----------------------------------------------

extension MainController: CallControllerDelegate {
    func CallControllerClose(controller: CallController) {
        guard let talkId = startMathModel?.startMatching.talkId else { return }
        presenter.declineTalks(talkId: talkId)
    }
}
