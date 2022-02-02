//
//  RequestCell.swift
//  Hark
//
//  Created by Andrey S on 19.01.2022.
//

import UIKit

protocol RequestDelegate: AnyObject {
    func requestDelete(cell: RequestCell, model: RequestsModel)
    func requestRegect(cell: RequestCell, model: RequestsModel)
    func requestConfirm(cell: RequestCell)
}

class RequestCell: UITableViewCell {

    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var sentLabel: UILabel!
    @IBOutlet weak var confirmedButton: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var receivedLabel: UILabel!
    
    weak var delegate: RequestDelegate?
    
    private var model: RequestsModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        confirmedButton.layer.cornerRadius = 18
        confirmedButton.layer.borderWidth = 1
        
        cornerView.layer.cornerRadius = 24
        cornerView.layer.borderWidth = 1
        cornerView.layer.borderColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1).cgColor
        
        confirmedButton.layer.borderColor = UIColor(red: 0.236, green: 0.858, blue: 0.746, alpha: 1).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(model: RequestsModel) {
        self.model = model
        
        receivedLabel.textColor = UIColor(rgb: 0x3CDBBE)
        
        if model.sentByYou {
            confirmedButton.isHidden = true
            switch model.status {
            case .harkRequestStatusAccepted:
                deleteButton.isHidden = true
                sentLabel.isHidden = true
                receivedLabel.text = "Recieved"
            case .harkRequestStatusPending:
                deleteButton.isHidden = false
                sentLabel.isHidden = false
                receivedLabel.text = ""
            case .harkRequestStatusRejected:
                sentLabel.isHidden = true
                deleteButton.isHidden = false
                receivedLabel.textColor = UIColor(rgb: 0xFF4E4E)
                receivedLabel.text = "Rejected"
            default:
                break
            }
        } else {
            sentLabel.isHidden = true
            switch model.status {
            case .harkRequestStatusAccepted:
                deleteButton.isHidden = true
                confirmedButton.isHidden = true
                receivedLabel.text = "Accepted"
            case .harkRequestStatusPending:
                deleteButton.isHidden = false
                confirmedButton.isHidden = false
                receivedLabel.text = ""
            case .harkRequestStatusRejected:
                deleteButton.isHidden = true
                confirmedButton.isHidden = true
                receivedLabel.textColor = UIColor(rgb: 0xFF4E4E)
                receivedLabel.text = "Rejected"
            default:
                break
            }
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd:MM:yy | HH:mm"
        dateLabel.text = dateFormatter.string(from: model.talk.date)
        
        if let duration = model.talk.duration {
            var durationString = ""
            if let durationHour = duration.hours {
                durationString.append("\(durationHour) hours ")
            }
            if let durationMinutes = duration.minutes {
                durationString.append("\(durationMinutes) min ")
            }
            if let durationSeconds = duration.seconds {
                durationString.append("\(durationSeconds) sec ")
            }
            durationLabel.text = durationString
        } else {
            durationLabel.text = "0 min"
        }
    }
    
    //----------------------------------------------
    // MARK: - Actions
    //----------------------------------------------
    
    @IBAction func actionDeleteRequest(_ sender: UIButton) {
        guard let model = model else { return }
        if model.sentByYou {
            delegate?.requestDelete(cell: self, model: model)
        } else {
            delegate?.requestRegect(cell: self, model: model)
        }
    }
    
    @IBAction func actionConfirmRequest(_ sender: UIButton) {
    }
}
