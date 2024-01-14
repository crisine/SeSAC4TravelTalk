//
//  ChatListTableViewCell.swift
//  SeSAC4TravelTalk
//
//  Created by Minho on 1/14/24.
//

import UIKit

class ChatListTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var chatLabel: UILabel!
    
    static let identifier: String = "ChatListTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.font = .boldSystemFont(ofSize: 14)
        
        dateLabel.font = .systemFont(ofSize: 13)
        dateLabel.textColor = .gray
        
        chatLabel.font = .systemFont(ofSize: 12)
        dateLabel.textColor = .gray
        
        print("awakeFromNib called")
    }
    
    func configureCell(data: ChatRoom) {
        
        if let chatData = data.chatList.last {
            nameLabel.text = data.chatroomName
            chatLabel.text = chatData.message
            dateLabel.text = Util.changeStringFormat(dateString: chatData.date, formatFrom: "yyyy-MM-dd HH:mm", formatTo: "yy.MM.dd")
        }
        
        profileImageView.image = UIImage(named: data.chatroomImage[0])
        profileImageView.contentMode = .scaleAspectFill
        
        DispatchQueue.main.async {
            self.profileImageView.clipsToBounds = true
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.width / 2
        }
    }
}
