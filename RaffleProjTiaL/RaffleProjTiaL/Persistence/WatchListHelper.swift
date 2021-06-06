//
//  FavoriteHelper.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import Foundation

struct WatchListManager {
    
    private init() {}
    
    static let manager = WatchListManager()
    
    private let persistenceHelper = PersistenceHelper<Raffle>(fileName: "playlistPersisted.plist")
    
    func saveWatchList(watchlistData: Raffle) throws {
        try persistenceHelper.save(newElement: watchlistData)
    }
    
    func getWatchList() throws -> [Raffle] {
        return try persistenceHelper.getObjects()
    }
    
    func deleteWatchList(watchList: [Raffle], atIndex: Int) throws {
        try persistenceHelper.delete(elements: watchList, index: atIndex)
    }
}
