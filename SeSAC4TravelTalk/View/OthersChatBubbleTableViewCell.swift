//
//  OthersChatBubbleTableViewCell.swift
//  SeSAC4TravelTalk
//
//  Created by Minho on 1/15/24.
//

import UIKit

class OthersChatBubbleTableViewCell: UITableViewCell,
                                     ConfigurableChatCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var messageBackgroundView: UIView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    static let identifier = "OthersChatBubbleTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(data: Chat) {
        profileImageView.image = UIImage(named: data.user.profileImage)
        profileImageView.contentMode = .scaleAspectFill
        
        messageBackgroundView.layer.borderColor = .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        messageBackgroundView.layer.borderWidth = 1
        
        nickNameLabel.text = data.user.rawValue
        nickNameLabel.font = .systemFont(ofSize: 12)
        
        timeLabel.text = Util.changeStringFormat(dateString: data.date, formatFrom: "yyyy-MM-dd HH:mm", formatTo: "HH:mm a")
        timeLabel.textColor = .gray
        timeLabel.font = .systemFont(ofSize: 10)
        
        messageLabel.text = data.message
        messageLabel.numberOfLines = 0
        messageLabel.font = .systemFont(ofSize: 12)
    
        DispatchQueue.main.async {
            self.profileImageView.clipsToBounds = true
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
            
            self.messageBackgroundView.clipsToBounds = true
            self.messageBackgroundView.layer.cornerRadius = 8
        }
    }
    
}
