
import UIKit
import AgoraRtcKit
import Lottie
import Cosmos

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
    @IBOutlet weak var declineCallButtonLayoutConstraint: NSLayoutConstraint!
    @IBOutlet weak var acceptCallButtonLayoutConstraint: NSLayoutConstraint!
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
    @IBOutlet weak var talkDurationTitleLabel: UILabel!
    @IBOutlet weak var talkDurationLabel: UILabel!
    @IBOutlet weak var micButton: UIButton!
    @IBOutlet weak var speakerButton: UIButton!
    @IBOutlet weak var micLabel: UILabel!
    @IBOutlet weak var speakerLabel: UILabel!
    @IBOutlet weak var addToHarksButton: UIButton!
    @IBOutlet weak var blockUserButton: UIButton!
    @IBOutlet weak var findAnotherButton: UIButton!
    @IBOutlet weak var leaveTalkButton: UIButton!
    @IBOutlet weak var backToMainButton: UIButton!
    
    @IBOutlet weak var declineButton: UIButton!
    @IBOutlet weak var acceptButton: UIButton!
    
    //----------------------------------------------
    // MARK: - Private property
    //----------------------------------------------
    
    private let name: String?
    private var agoraKit: AgoraRtcEngineKit?
    
    weak var delegate: CallControllerDelegate?
    
    private let model: CallProtocol
    private lazy var presenter = CallPresenter(view: self)
    private var callType: CallType
    
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
        nameLabel.text = name ?? ""
        infoLabel.text = "Calling..."
        
        lottieView.loopMode = .loop
        lottieView.play(completion: nil)
        
        starsView.settings.updateOnTouch = true
        starsView.settings.fillMode = .full
        
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
        
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "f6b0210161b64abdb5d97ddd9456d8cc", delegate: self)
        agoraKit?.joinChannel(byToken: model.token,
                              channelId: model.channelName,
                              info: nil,
                              uid: model.uid,
                              joinSuccess: { [weak self] (channel, uid, elapsed) in
            
            let string = "Thank you for using Hark anonymous communication"
            let utterance = AVSpeechUtterance(string: string)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")

            let synth = AVSpeechSynthesizer()
            synth.speak(utterance)
            
            self?.agoraKit?.setEnableSpeakerphone(true)
            UIApplication.shared.isIdleTimerDisabled = true
        })
    }
    
    private func endCalls() {
        presenter.unsubscirbeTallk()
        AgoraRtcEngineKit.destroy()
        UIApplication.shared.isIdleTimerDisabled = false
        self.delegate?.callControllerClose(controller: self)
        agoraKit?.leaveChannel({ stats in
            
        })
        self.dismiss(animated: false)
    }
    
    private func updateTypeScreen() {
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
    }
    
    @IBAction func actionMic(_ sender: UIButton) {
        agoraKit?.muteLocalAudioStream(sender.isSelected)
    }
    
    @IBAction func actionSpeaker(_ sender: UIButton) {
        agoraKit?.setEnableSpeakerphone(sender.isSelected)
    }
    
    @IBAction func actionAddToHarks(_ sender: UIButton) {
        
    }
    
    @IBAction func actionBlockUser(_ sender: UIButton) {
        
    }
    
    @IBAction func actionFindAnother(_ sender: UIButton) {
        
    }
    
    @IBAction func actionBackToMain(_ sender: UIButton) {
        
    }
    
    @IBAction func actionLeaveTalk(_ sender: UIButton) {
        presenter.declineTalks(talkId: model.talkId)
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
        updateTypeScreen()
    }
}

//----------------------------------------------
// MARK: - CallOutputProtocol
//----------------------------------------------

extension CallController: CallOutputProtocol {
    func endCall() {
        endCalls()
    }
    
    func successDecline() {
        endCalls()
    }
}
