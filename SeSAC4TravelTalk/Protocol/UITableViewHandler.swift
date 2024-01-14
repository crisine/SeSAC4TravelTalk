//
//  UITableViewHandler.swift
//  SeSAC4TravelTalk
//
//  Created by Minho on 1/14/24.
//

import UIKit

protocol UITableViewHandler: UITableViewDelegate, 
                             UITableViewDataSource {
    
    func configureTableView()
}
