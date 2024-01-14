//
//  Util.swift
//  SeSAC4TravelTalk
//
//  Created by Minho on 1/15/24.
//

import UIKit

struct Util {
    static func changeStringFormat(dateString: String, formatFrom: String, formatTo: String) -> String? {
        let srcDateFormatter = DateFormatter()
        srcDateFormatter.dateFormat = formatFrom
        
        if let date = srcDateFormatter.date(from: dateString) {
            let descDateFormatter = DateFormatter()
            descDateFormatter.locale = Locale(identifier: "ko_KR")
            descDateFormatter.dateFormat = formatTo
            
            let convertedString = descDateFormatter.string(from: date)
            return convertedString
        }
        
        return nil
    }
}
