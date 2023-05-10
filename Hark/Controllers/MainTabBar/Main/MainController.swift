//
//  MainController.swift
//  Hark
//
//  Created by mob325 on 11.01.2022.
//

import UIKit
import Lottie
import AppTrackingTransparency
import FBSDKCoreKit

class MainController: BaseController {
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------
    
    @IBOutlet weak var lottieView: AnimationView!
    
    @IBOutlet weak var totalOnlineLabel: UILabel!
    
    @IBOutlet weak var totalWomenLabel: UILabel!
    @IBOutlet weak var totalMenLabel: UILabel!
    @IBOutlet weak var totalCommonLabel: UILabel!
    
    @IBOutlet weak var totalTalksLabel: UILabel!
    
    @IBOutlet weak var mainCountImageView: UIImageView!
    @IBOutlet weak var countsStackView: UIStackView!
    @IBOutlet weak var inTalksLAbel: UILabel!
    
    @IBOutlet weak var startSearchButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Property
    //----------------------------------------------
    
    private lazy var presenter = MainPresenter(view: self)
    private var isStartSearch = false
    private var startMathModel: StartMatchingModel?
    private var waitTimer: Timer?
    private var waitTime = ""
    private var startTime: Date!
    
    private lazy var formatter: DateComponentsFormatter = {
        let _formatter = DateComponentsFormatter()
        _formatter.allowedUnits = [.hour, .minute, .second]
        _formatter.zeroFormattingBehavior = .pad
        return _formatter
    }()
    
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
        presenter.subscribeCallUser()
        updateStartSearch(false)
        presenter.getOnlineStatistics()
        checkingStatistics()
        askTrackingTransparency()
    }
    
    private func askTrackingTransparency() {
        if #available(iOS 14, *) {
            if ATTrackingManager.trackingAuthorizationStatus != .authorized && ATTrackingManager.trackingAuthorizationStatus != .denied {
                ATTrackingManager.requestTrackingAuthorization {  status in
                    switch status {
                    case .authorized:
                        Settings.shared.isAdvertiserIDCollectionEnabled = true
                        Settings.shared.isAdvertiserTrackingEnabled = true
                        break
                    case .denied:
                        Settings.shared.isAdvertiserIDCollectionEnabled = false
                        Settings.shared.isAdvertiserTrackingEnabled = false
                        break
                    case .notDetermined:
                        print("Not Determined")
                    case .restricted:
                        Settings.shared.isAdvertiserIDCollectionEnabled = false
                        Settings.shared.isAdvertiserTrackingEnabled = false
                        print("Restricted")
                    @unknown default:
                        print("Unknown")
                    }
                }
            }
        }
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
        UIView.animate(withDuration: 1.0) {
            self.totalTalksLabel.alpha = search ? 0.0 : 1.0
            self.mainCountImageView.alpha = search ? 0.0 : 1.0
            self.countsStackView.alpha = search ? 0.0 : 1.0
            self.inTalksLAbel.alpha = search ? 0.0 : 1.0
            //self.searchingImageView.alpha = search ? 0.0 : 1.0
            
            self.lottieView.alpha = search ? 1.0 : 0.0
            self.lottieView.loopMode = .loop
            search ? self.lottieView.play(completion: nil) : self.lottieView.stop()
        
            self.startSearchButton.setTitle(search ? "Stop search" : "Start Search", for: .normal)
            self.startSearchButton.backgroundColor = search ? UIColor(rgb: 0x191919) : UIColor(rgb: 0x3CDBBE)
            self.startSearchButton.setTitleColor(search ? UIColor.white : UIColor.black, for: .normal)
        }
    }
    
    func startWaitTimer() {
        startTime = Date()
        waitTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTalkTimer), userInfo: nil, repeats: true)
    }

    func stopWaitTimer() {
        waitTimer?.invalidate()
        waitTimer = nil
    }

    @objc func handleTalkTimer() {
        waitTime = formatter.string(from: startTime, to: Date()) ?? ""
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
            AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_stop_search, values: ["wait_time" : waitTime])
        }
        
        AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_start_search)
    }
}

//----------------------------------------------
// MARK: - MainOutputProtocol
//----------------------------------------------

extension MainController: MainOutputProtocol {
    func getCall(model: UserModel) {
        navigationController?.popToRootViewController(animated: false)
        tabBarController?.selectedIndex = 0
        presenter.unsubscribeStartMath()
        presenter.unsubscirbeTallk()
        presenter.unsubscribeSubscribeCallUser()
        isStartSearch = false
        updateStartSearch(isStartSearch)
        
        DispatchQueue.main.async {
            self.presenter.subscribeTalkId(talkId: model.user.talkId)
            HarkListRouter(presenter: self.navigationController).presentCall(model: nil, delegate: self, callModel: model.user, callType: .incoming)
        }
    }
    
    func success() {
        checkingStatistics()
    }
    
    func successStartMath(model: StartMatchingModel) {
        startMathModel = model
        presenter.subscribeTalkId(talkId: model.startMatching.talkId)
        MainRouter(presenter: navigationController).presentMainGo(tabBarController: tabBarController, delegate: self, model: model)
    }
    
    func successTalkID() {
//        dismiss(animated: true)
        isStartSearch = false
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
        guard let searchModel = startMathModel else { return }
        dismiss(animated: false) {
            HarkListRouter(presenter: self.navigationController).presentCall(model: nil, delegate: self, callModel: searchModel.startMatching, callType: .matching)
        }
    }
}

//----------------------------------------------
// MARK: - CallControllerDelegate
//----------------------------------------------

extension MainController: CallControllerDelegate {
    func callControllerClose(controller: CallController) {
        presenter.subscribeCallUser()
        guard let talkId = startMathModel?.startMatching.talkId else { return }
        presenter.declineTalks(talkId: talkId)
    }
}
