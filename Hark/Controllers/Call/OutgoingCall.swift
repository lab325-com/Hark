
import UIKit
import AgoraRtcKit

class OutgoingCall: UIViewController {
    
    //----------------------------------------------
    // MARK: - IBOutlet
    //----------------------------------------------
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    //----------------------------------------------
    // MARK: - Private property
    //----------------------------------------------
    
    private let model: HarksListModel
    var agoraKit: AgoraRtcEngineKit?
    
    //----------------------------------------------
    // MARK: - Init
    //----------------------------------------------
    
    init(model: HarksListModel) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //----------------------------------------------
    // MARK: - Life cycle
    //----------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        initializeAndJoinChannel()
    }
    
    //----------------------------------------------
    // MARK: - Private methods
    //----------------------------------------------
    
    private func setup() {
        nameLabel.text = model.nickName
        infoLabel.text = "Calling..."
    }
    
    private func initializeAndJoinChannel() {
         agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: "f6b0210161b64abdb5d97ddd9456d8cc", delegate: self)
         agoraKit?.setChannelProfile(.liveBroadcasting)
         agoraKit?.setClientRole(.broadcaster)
         agoraKit?.joinChannel(byToken: "006f6b0210161b64abdb5d97ddd9456d8ccIAANa7CrUqdhKyY8H/ctxFEle47LEwRTkWZnBuSygFnQ7jLRTXgAAAAAEABfDyp7TR3wYQEAAQBNHfBh",
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
        agoraKit?.leaveChannel({ stats in
            self.dismiss(animated: false)
        })
    }
}

extension OutgoingCall: AgoraRtcEngineDelegate {
     func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
         
     }
 }
