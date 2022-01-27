
import UIKit
import AgoraRtcKit
import Lottie

protocol CallControllerDelegate: AnyObject {
    func callControllerClose(controller: CallController)
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
    @IBOutlet weak var lottieView: AnimationView!
    
    //----------------------------------------------
    // MARK: - Private property
    //----------------------------------------------
    
    private let name: String?
    private var agoraKit: AgoraRtcEngineKit?
    
    weak var delegate: CallControllerDelegate?
    
    //private let tempToken = "006f6b0210161b64abdb5d97ddd9456d8ccIABDWRogWEMyZPR2z0kapIxidg57ZsWR4G5FlJkV49GisDLRTXgAAAAAEAD45Mp24YvxYQEAAQDhi/Fh"
   // private let tempChannelID = "Test"
    
    private let model: CallProtocol
    private lazy var presenter = CallPresenter(view: self)
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(name: String?, delegate: CallControllerDelegate, model: CallProtocol) {
        self.model = model
        self.name = name
        self.delegate = delegate
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
        initializeAndJoinChannel()
    }
    
    //----------------------------------------------
    // MARK: - Private methods
    //----------------------------------------------
    
    private func setup() {
        nameLabel.text = name ?? ""
        infoLabel.text = "Calling..."
    }
    
    private func initializeAndJoinChannel() {
        
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "f6b0210161b64abdb5d97ddd9456d8cc", delegate: self)
        //agoraKit?.setChannelProfile(.liveBroadcasting)
        //agoraKit?.setClientRole(.broadcaster)
        agoraKit?.joinChannel(byToken: model.token,
                              channelId: model.channelName,
                              info: nil,
                              uid: model.uid,
                              joinSuccess: { [weak self] (channel, uid, elapsed) in
            self?.agoraKit?.setEnableSpeakerphone(true)
            UIApplication.shared.isIdleTimerDisabled = true
        })
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionAcceptCall(_ sender: UIButton) {
        
    }
    
    @IBAction func actionDeclineCall(_ sender: UIButton) {
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
    }
    
    func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
    }
}

//----------------------------------------------
// MARK: - CallOutputProtocol
//----------------------------------------------

extension CallController: CallOutputProtocol {
    func endCall() {
        AgoraRtcEngineKit.destroy()
        UIApplication.shared.isIdleTimerDisabled = false
        self.delegate?.callControllerClose(controller: self)
        self.dismiss(animated: false)
        agoraKit?.leaveChannel({ stats in
            
        })
    }
    
    func successDecline() {
        AgoraRtcEngineKit.destroy()
        UIApplication.shared.isIdleTimerDisabled = false
        self.delegate?.callControllerClose(controller: self)
        self.dismiss(animated: false)
        agoraKit?.leaveChannel({ stats in
            
        })
    }
}
