//
//  MyChatBubbleTableViewCell.swift
//  SeSAC4TravelTalk
//
//  Created by Minho on 1/15/24.
//

import UIKit

class MyChatBubbleTableViewCell: UITableViewCell,
                                 ConfigurableChatCell {

    @IBOutlet weak var messageBackgroundView: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    static let identifier = "MyChatBubbleTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageBackgroundView.backgroundColor = .systemGray5
        messageBackgroundView.layer.borderColor = .init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        messageBackgroundView.layer.borderWidth = 1
        
        messageBackgroundView.clipsToBounds = true
        messageBackgroundView.layer.cornerRadius = 8
    }

    func configureCell(data: Chat) {
        timeLabel.text = Util.changeStringFormat(dateString: data.date, formatFrom: "yyyy-MM-dd HH:mm", formatTo: "HH:mm a")
        timeLabel.textColor = .gray
        timeLabel.font = .systemFont(ofSize: 10)
        
        messageLabel.text = data.message
        messageLabel.font = .systemFont(ofSize: 12)
        messageLabel.numberOfLines = 0
    }
    
}
