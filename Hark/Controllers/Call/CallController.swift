
import UIKit
import AgoraRtcKit
import Lottie
import Cosmos

fileprivate let kAppId = "f6b0210161b64abdb5d97ddd9456d8cc"
fileprivate let kMicActive = "call_mic_active_ic"
fileprivate let kMicInactive = "call_mic_inatcive_ic"
fileprivate let kSpeakerActive = "call_speaker_active_ic"
fileprivate let kSpeakerInactive = "call_speaker_inactive_ic"
fileprivate let kRateActive = "call_rate_active_ic"

protocol CallControllerDelegate: AnyObject {
    func callControllerClose(controller: CallController)
}

enum CallType {
    case matching
    case incoming
    case outgoing
}

class CallController: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var preCallView: UIView!
    @IBOutlet weak var acceptCallButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var callView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var callerLabel: UILabel!
    @IBOutlet weak var calleeLabel: UILabel!
    @IBOutlet weak var rateImageView: UIImageView!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var lottieView: AnimationView!
    @IBOutlet weak var starsView: CosmosView!
    @IBOutlet weak var buttonsStackView: UIStackView!
    @IBOutlet weak var talkDurationTitleLabel: UILabel!
    @IBOutlet weak var talkDurationLabel: UILabel!
    @IBOutlet weak var talkDurationBottomLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var speakerButton: UIButton!
    @IBOutlet weak var micLabel: UILabel!
    @IBOutlet weak var speakerLabel: UILabel!
    @IBOutlet weak var addToHarksButton: UIButton!
    @IBOutlet weak var blockUserButton: UIButton!
    @IBOutlet weak var reportButton: UIButton!
    @IBOutlet weak var leaveTalkButton: UIButton!
    @IBOutlet weak var backToMainButton: UIButton!
    @IBOutlet weak var declineButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Private property
    //----------------------------------------------
    
    weak var delegate: CallControllerDelegate?
    
    private let name: String?
    private let model: CallProtocol
    
    private var agoraKit: AgoraRtcEngineKit?
    private var callType: CallType
    
    private var isActiveMic = true
    private var isActiveSpeaker = false
    
    var talkTimer: Timer?
    var startTime: Date!
    var rate = 0
    
    private lazy var formatter: DateComponentsFormatter = {
        let _formatter = DateComponentsFormatter()
        _formatter.allowedUnits = [.hour, .minute, .second]
        _formatter.zeroFormattingBehavior = .pad
        return _formatter
    }()
    
    private lazy var presenter = CallPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(name: String?, delegate: CallControllerDelegate, model: CallProtocol, callType: CallType) {
        self.model = model
        self.name = name
        self.delegate = delegate
        self.callType = callType
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------

    override func viewDidLoad() {
        hiddenNavigationBar = true
        super.viewDidLoad()
        
        setup()
    }
    
    //----------------------------------------------
    // MARK: - Private methods
    //----------------------------------------------
    
    private func setup() {
        nameLabel.text = name ?? "anonymous"
        infoLabel.text = "Calling..."
        
        callerLabel.text = KeychainService.standard.me?.nickName
        calleeLabel.text = name ?? "anonymous"
        
        lottieView.loopMode = .loop
        lottieView.play(completion: nil)
        
        starsView.settings.updateOnTouch = true
        starsView.settings.fillMode = .full
        starsView.didFinishTouchingCosmos = { rating in
            self.rate = Int(rating)
        }
        
        AudioServicesPlayAlertSound(SystemSoundID(1322))
        
        switch callType {
        case .matching:
            initializeAndJoinChannel()
            preCallView.isHidden = true
            callView.isHidden = false
        case .incoming:
            preCallView.isHidden = false
            callView.isHidden = true
        case .outgoing:
            initializeAndJoinChannel()
            acceptButton.isHidden = true
            preCallView.isHidden = false
            callView.isHidden = true
        }
    }
    
    private func initializeAndJoinChannel() {
        presenter.subscribeTalkId(talkId: model.talkId)
        
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: kAppId, delegate: self)
        agoraKit?.joinChannel(byToken: model.token,
                              channelId: model.channelName,
                              info: nil,
                              uid: model.uid,
                              joinSuccess: { [weak self] (channel, uid, elapsed) in
            
            let string = "" //Thank you for using Hark anonymous communication
            let utterance = AVSpeechUtterance(string: string)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

            let synth = AVSpeechSynthesizer()
            synth.speak(utterance)
                        
            UIApplication.shared.isIdleTimerDisabled = true
            
            self?.startTalkTimer()
        })
    }
    
    func startTalkTimer() {
        startTime = Date()
        talkTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(handleTalkTimer), userInfo: nil, repeats: true)
    }

    func stopTalkTimer() {
        talkTimer?.invalidate()
        talkTimer = nil
    }

    @objc func handleTalkTimer() {
        talkDurationLabel.text = formatter.string(from: startTime, to: Date())
    }
    
    private func endCalls() {
        presenter.unsubscirbeTallk()
        AgoraRtcEngineKit.destroy()
        UIApplication.shared.isIdleTimerDisabled = false
        agoraKit?.leaveChannel({ stats in
            
        })
        
        AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_talk_duration, values: ["talk_duration" : talkDurationLabel.text ?? ""])
        
        showEndCallView()
    }
    
    private func updateView() {
        switch callType {
        case .matching:
            preCallView.isHidden = true
            callView.isHidden = false
        case .incoming:
            preCallView.isHidden = false
            callView.isHidden = true
        case .outgoing:
            acceptButton.isHidden = true
            preCallView.isHidden = false
            callView.isHidden = true
        }
        
        micButton.setImage(UIImage(named: isActiveMic ? kMicActive : kMicInactive), for: .normal)
        speakerButton.setImage(UIImage(named: isActiveSpeaker ? kSpeakerActive : kSpeakerInactive), for: .normal)
    }
    
    private func showEndCallView() {
        lottieView.stop()
        stopTalkTimer()
        
        lottieView.isHidden = true
        micButton.isHidden = true
        micLabel.isEnabled = true
        speakerButton.isHidden = true
        speakerLabel.isHidden = true
        leaveTalkButton.isHidden = true
        
        titleLabel.text = "After Talk"
        
        rateImageView.image = UIImage(named: kRateActive)
        
        talkDurationBottomLayoutConstraint.constant = 50.0
        
        feedbackLabel.isHidden = false
        starsView.isHidden = false
        buttonsStackView.isHidden = false
    }
    
    private func closeController() {
        dismiss(animated: false)
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionAcceptCall(_ sender: UIButton) {
        acceptButton.isHidden = true
        initializeAndJoinChannel()
    }
    
    @IBAction func actionDeclineCall(_ sender: UIButton) {
        presenter.declineTalks(talkId: model.talkId)
        closeController()
    }
    
    @IBAction func actionMic(_ sender: UIButton) {
        isActiveMic = isActiveMic ? false : true
        agoraKit?.muteLocalAudioStream(!isActiveMic)
        updateView()
    }
    
    @IBAction func actionSpeaker(_ sender: UIButton) {
        isActiveSpeaker = isActiveSpeaker ? false : true
        agoraKit?.setEnableSpeakerphone(isActiveSpeaker)
        updateView()
        
        AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_talk_speaker, values: ["talk_speaker" : isActiveSpeaker ? "on" : "off"])
    }
    
    @IBAction func actionAddToHarks(_ sender: UIButton) {
        presenter.sendHarkRequest(talkId: model.talkId, userId: model.matchedUserId, nickName: name ?? "anonymous")
        
        AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_talk_add_to_hark)
    }
    
    @IBAction func actionBlockUser(_ sender: UIButton) {
        presenter.blockUser(userId: model.matchedUserId)
    }
    
    @IBAction func actionReport(_ sender: UIButton) {
        dismiss(animated: false) {
            let currentNavigationController = RootRouter.sharedInstance.topViewController?.navigationController
            CallRouter(presenter: currentNavigationController).presentReport(userId: self.model.user.id)
        }
    }
    
    @IBAction func actionBackToMain(_ sender: UIButton) {
        if rate != 0 {
            presenter.sendTalkFeedback(talkId: model.talkId, rate: rate)
            AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_talk_rate, values: ["talk_rate" : rate])
        } else {
            closeController()
        }
    }
    
    @IBAction func actionLeaveTalk(_ sender: UIButton) {
        presenter.declineTalks(talkId: model.talkId)
        showEndCallView()
        
        let me = KeychainService.standard.me
        AnalyticManager.sendAppsFlyerEvent(event: .appsflyer_talk_leave, values: ["caller_1_age" : me?.age ?? "",
                                                                                  "caller_1_gender" : me?.gender?.rawValue ?? "",
                                                                                  "caller_2_age" : model.user.age,
                                                                                  "caller_2_gender" : model.user.gender.rawValue])
    }
}

//----------------------------------------------
// MARK: - AgoraRtcEngineDelegate
//----------------------------------------------

extension CallController: AgoraRtcEngineDelegate {
    func rtcEngine(_ engine: AgoraRtcEngineKit, didOccurWarning warningCode: AgoraWarningCode) {
        debugPrint("⚠️ AgoraWarningCode --> \(warningCode.rawValue)")
    }
    
    func rtcEngine(_ engine: AgoraRtcEngineKit, didOccurError errorCode: AgoraErrorCode) {
        debugPrint("⛔️ AgoraErrorCode --> \(errorCode.rawValue)")
        
        let alert = UIAlertController(title: "Calls", message: "Problem with connection: ⛔️ errorCode --> \(errorCode.rawValue)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.presenter.declineTalks(talkId: self.model.talkId)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
        callType = .matching
        updateView()
    }
}

//----------------------------------------------
// MARK: - CallOutputProtocol
//----------------------------------------------

extension CallController: CallOutputProtocol {
    func successSendHarkRequest() {
        closeController()
    }
    
    func successBlockUser() {
        closeController()
    }
    
    func successSendTalkFeedback() {
        closeController()
    }
    
    func endCall() {
        endCalls()
    }
    
    func successDecline() {
        endCalls()
    }
    
    func failure(error: String) {
        print(error)
        closeController()
    }
}
