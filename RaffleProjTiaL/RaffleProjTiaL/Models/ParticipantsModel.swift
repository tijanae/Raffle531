//
//  ParticipantsModel.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import Foundation


enum ParticipantsError: Error {
    case decodingError(Error)
}

struct Participants: Codable {
    let id: Int
    let raffle_id: Int
    let firstname: String
    let lastname: String
    let email: String
    let phone: String?
    //let registered_at: String
    
    
    static func getAllParticipants(from data: Data) throws -> [Participants] {
        do {
            let participants = try JSONDecoder().decode([Participants].self, from: data)
            return participants
        } catch{
            throw ParticipantsError.decodingError(error)
        }
    }
}
