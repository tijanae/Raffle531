//
//  AllRaffleModel.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import Foundation

enum RaffleError: Error {
    case decodingError(Error)
}

struct Raffle: Codable {
    let id: Int
    let name: String
    let created_at: String
    let raffled_at: String?
    //let winner_id: Int?
    
    static func getAllRaffles(from data: Data) throws -> [Raffle] {
        do {
            let raffle = try JSONDecoder().decode([Raffle].self, from: data)
            return raffle
        } catch{
            fatalError("couldnt decode model in all raffle model")
            //throw RaffleError.decodingError(error)
        }
    }
    
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
    
    var dateRaffled: String  {
        
        if let dateCreatedString = raffled_at {
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = dateFormatter.date(from: dateCreatedString)
            
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            let formattedDate = dateFormatter.string(from: date!)
            return "\(formattedDate)"
        } else {
            return "This Raffle has not closed yet."
        }
    }
    
    
}
