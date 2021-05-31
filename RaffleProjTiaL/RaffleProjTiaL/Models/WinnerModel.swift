//
//  WinnerModel.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/31/21.
//

import Foundation

enum WinnerError: Error {
    case decodingError(Error)
}

struct Winner: Codable {
    let id: Int
    let raffle_id: Int
    let firstname: String
    let lastname: String
    let email: String
    let phone: String?
    //let registered_at: String
    
    
    static func getWinner(from data: Data) throws -> Winner {
        do {
            let winner = try JSONDecoder().decode(Winner.self, from: data)
            return winner
        } catch{
            throw WinnerError.decodingError(error)
        }
    }
}
