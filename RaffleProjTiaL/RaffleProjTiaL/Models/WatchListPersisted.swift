//
//  WatchListPersisted.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import Foundation

struct WatchListPersisted: Codable {
    let id: Int
    let name: String
    let created_at: String
    
    var dateCreated: String  {
            let dateCreatedString = created_at
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = dateFormatter.date(from: dateCreatedString)
            
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            let formattedDate = dateFormatter.string(from: date!)
            return "\(formattedDate)"
    }
}
