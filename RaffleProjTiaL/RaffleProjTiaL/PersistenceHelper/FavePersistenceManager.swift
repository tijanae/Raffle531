//
//  FavePersistenceManager.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/31/21.
//

import Foundation

struct FavePersistenceManager {
    
    private init() {}
    
    static let manager = FavePersistenceManager()
    
    private let persistenceHelper = PersistenceHelper<WatchListPersisted>(fileName: "watchListPersisted.plist")
    
    func savePlaylist(playlistData: WatchListPersisted) throws {
        try persistenceHelper.save(newElement: playlistData)
    }
    
    func getPlaylist() throws -> [WatchListPersisted] {
        return try persistenceHelper.getObjects()
    }
    
    func deletePlaylist(playlist: [WatchListPersisted], atIndex: Int) throws {
        try persistenceHelper.delete(elements: playlist, index: atIndex)
    }
}
