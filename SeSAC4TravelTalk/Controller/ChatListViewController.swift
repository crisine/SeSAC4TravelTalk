//
//  ChatListViewController.swift
//  SeSAC4TravelTalk
//
//  Created by Minho on 1/14/24.
//

import UIKit

class ChatListViewController: UIViewController,
                              UITableViewHandler,
                              UISearchBarDelegate {
    
    @IBOutlet weak var chatListTableView: UITableView!
    @IBOutlet weak var chatListSearchBar: UISearchBar!
    
    var chattingData: [ChatRoom] = mockChatList
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "TRAVEL TALK"
        configureTableView()
        
        chatListSearchBar.placeholder = "친구 이름을 검색해보세요"
        
        chatListTableView.separatorStyle = .none
        
        print("ChatListVC viewDidLoad Called")
    }
    
    func configureTableView() {
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        
        let identifier = ChatListTableViewCell.identifier
        let xib = UINib(nibName: identifier, bundle: nil)
        chatListTableView.register(xib, forCellReuseIdentifier: identifier)
        
        print("configureTableView Called")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText != "" {
            chattingData = mockChatList.filter { $0.chatroomName.lowercased().contains(searchText.lowercased()) }
        } else {
            chattingData = mockChatList
        }
    
        self.chatListTableView.reloadData()
        print("\(searchText)")
    }
}

extension ChatListViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections Called")
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection Called, \(chattingData.count)")
        return chattingData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell", for: indexPath) as! ChatListTableViewCell
        
        cell.configureCell(data: chattingData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: ChatRoomViewController.identifier) as! ChatRoomViewController
        
        vc.chatRoomData = chattingData[indexPath.row]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.pushViewController(vc, animated: true)
        
        tableView.reloadRows(at: [indexPath], with: .fade)
    }
}
