
import UIKit
import AgoraRtcKit
import Lottie

protocol CallControllerDelegate: AnyObject {
    func CallControllerClose(controller: CallController)
}

extension CallControllerDelegate {
    func CallControllerClose(controller: CallController) {}
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
    
    private let model: HarksListModel?
    private var agoraKit: AgoraRtcEngineKit?
    
    weak var delegate: CallControllerDelegate?
    
    private let tempToken = "006f6b0210161b64abdb5d97ddd9456d8ccIABDWRogWEMyZPR2z0kapIxidg57ZsWR4G5FlJkV49GisDLRTXgAAAAAEAD45Mp24YvxYQEAAQDhi/Fh"
    private let tempChannelID = "Test"
    
    private let token: String?
    private let chanelID: String?
    private let uid: UInt?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(model: HarksListModel?, delegate: CallControllerDelegate, token: String?, chanelID: String?, uid: UInt?) {
        self.token = token
        self.chanelID = chanelID
        self.uid = uid
        self.model = model
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
        nameLabel.text = model?.nickName ?? ""
        infoLabel.text = "Calling..."
    }
    
    private func initializeAndJoinChannel() {
        
        agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "f6b0210161b64abdb5d97ddd9456d8cc", delegate: self)
        //agoraKit?.setChannelProfile(.liveBroadcasting)
        //agoraKit?.setClientRole(.broadcaster)
        agoraKit?.joinChannel(byToken: token ?? tempToken,
                              channelId: chanelID ?? tempChannelID,
                              info: nil,
                              uid: uid ?? 0,
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
        UIApplication.shared.isIdleTimerDisabled = false
        self.delegate?.CallControllerClose(controller: self)
        self.dismiss(animated: false)
        agoraKit?.leaveChannel({ stats in
            
        })
    }
}

extension CallController: AgoraRtcEngineDelegate {
    func rtcEngine(_ engine: AgoraRtcEngineKit, didOccurError errorCode: AgoraErrorCode) {
        debugPrint(errorCode)
    }
    
    func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
        
    }
}
