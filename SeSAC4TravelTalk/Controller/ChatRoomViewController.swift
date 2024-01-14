//
//  ChatRoomViewController.swift
//  SeSAC4TravelTalk
//
//  Created by Minho on 1/15/24.
//

import UIKit

class ChatRoomViewController: UIViewController,
                              UITableViewHandler {
    
    @IBOutlet weak var chatRoomTableView: UITableView!
    @IBOutlet weak var bottomBackgroundView: UIView!
    @IBOutlet weak var textFieldBackgroundView: UIView!
    @IBOutlet weak var chatInputTextField: UITextField!
    @IBOutlet weak var sendChatButton: UIButton!
    
    static let identifier = "ChatRoomViewController"
    var chatRoomData: ChatRoom?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = chatRoomData?.chatroomName
        navigationController?.navigationBar.tintColor = .black
        
        chatRoomTableView.separatorStyle = .none
        
        configureUI()
        configureTableView()
    }
    
    func configureUI() {
        
        textFieldBackgroundView.backgroundColor = .systemGray6
        textFieldBackgroundView.clipsToBounds = true
        textFieldBackgroundView.layer.cornerRadius = 8
        
        chatInputTextField.placeholder = "메세지를 입력하세요"
        chatInputTextField.backgroundColor = textFieldBackgroundView.backgroundColor
        chatInputTextField.borderStyle = .none
        
        sendChatButton.setImage(UIImage(systemName: "paperplane"), for: .normal)
        sendChatButton.setTitle("", for: .normal)
        sendChatButton.tintColor = .systemGray4
    }
    
    func configureTableView() {
        chatRoomTableView.delegate = self
        chatRoomTableView.dataSource = self
        
        let identifier1 = MyChatBubbleTableViewCell.identifier
        let xib1 = UINib(nibName: identifier1, bundle: nil)
        chatRoomTableView.register(xib1, forCellReuseIdentifier: identifier1)
        
        let identifier2 = OthersChatBubbleTableViewCell.identifier
        let xib2 = UINib(nibName: identifier2, bundle: nil)
        chatRoomTableView.register(xib2, forCellReuseIdentifier: identifier2)
    }
}

extension ChatRoomViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList[section].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 먼저 index로 chatList에 접근해서 현재 표시해야 할 내용의 사람이 나인지, 상대방인지 구분 후에 표시해야 함.
        
        // MARK: Optional Unwrapping 에러 여지 있음
        let chatData = chatRoomData!.chatList[indexPath.row]
        let bubbleType = chatData.user
        
        print("ChatRoomVC cellForRowAt Called")
        
        switch bubbleType {
        case .user:
            let cell = tableView.dequeueReusableCell(withIdentifier: MyChatBubbleTableViewCell.identifier, for: indexPath) as! MyChatBubbleTableViewCell
            
            cell.configureCell(data: chatData)
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: OthersChatBubbleTableViewCell.identifier, for: indexPath) as! OthersChatBubbleTableViewCell
            
            cell.configureCell(data: chatData)
            
            return cell
        }
    }
}
