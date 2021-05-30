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
    
    private let persistenceHelper = PersistenceHelper<WatchListPersisted>(fileName: "playlistPersisted.plist")
    
    func saveWatchList(playlistData: WatchListPersisted) throws {
        try persistenceHelper.save(newElement: playlistData)
    }
    
    func getWatchList() throws -> [WatchListPersisted] {
        return try persistenceHelper.getObjects()
    }
    
    func deleteWatchList(watchList: [WatchListPersisted], atIndex: Int) throws {
        try persistenceHelper.delete(elements: watchList, index: atIndex)
    }
}
