
import UIKit
import AgoraRtcKit

protocol OutgoingCallDelegate: AnyObject {
    func outgoingCallClose(controller: OutgoingCall)
}

extension OutgoingCallDelegate {
    func outgoingCallClose(controller: OutgoingCall) {}
}

class OutgoingCall: BaseController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Private property
    //----------------------------------------------
    
    private let model: HarksListModel?
    var agoraKit: AgoraRtcEngineKit?
    weak var delegate: OutgoingCallDelegate?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(model: HarksListModel?, delegate: OutgoingCallDelegate) {
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
        agoraKit?.setChannelProfile(.liveBroadcasting)
        agoraKit?.setClientRole(.broadcaster)
        agoraKit?.joinChannel(byToken: "006f6b0210161b64abdb5d97ddd9456d8ccIABDWRogWEMyZPR2z0kapIxidg57ZsWR4G5FlJkV49GisDLRTXgAAAAAEAD45Mp24YvxYQEAAQDhi/Fh",
                              channelId: "Test",
                              info: nil,
                              uid: 0,
                              joinSuccess: { (channel, uid, elapsed) in
            
        })
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionDeclineCall(_ sender: UIButton) {
        self.delegate?.outgoingCallClose(controller: self)
        self.dismiss(animated: false)
        agoraKit?.leaveChannel({ stats in
            
        })
    }
}

extension OutgoingCall: AgoraRtcEngineDelegate {
     func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
         
     }
 }
