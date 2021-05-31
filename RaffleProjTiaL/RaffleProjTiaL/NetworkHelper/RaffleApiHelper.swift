//
//  RaffleApiHelper.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import Foundation

struct raffleApiHelper {
    
    static let manager = raffleApiHelper()
    
    func getRaffleData(completionHandler: @escaping (Result<[AllRaffles], AppError>) -> () ) {
        
        NetworkHelper.manager.performDataTask(withUrl: raffleURL, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
                return
            case .success(let data):
                do {
                    let raffleData = try JSONDecoder().decode([AllRaffles].self, from: data)
                    completionHandler(.success(raffleData))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
    func postRaffle(_ raffle: Raffle, completionHandler: @escaping (Result<Data, AppError>) -> Void) {
        
        guard let encodedRaffleWrapper = try? JSONEncoder().encode(raffle) else {
            fatalError("Unable to json encode project")
        }
        
        print(String(data: encodedRaffleWrapper, encoding: .utf8)!)
        
        NetworkHelper.manager.performDataTask(withUrl: raffleURL, andHTTPBody: encodedRaffleWrapper, andMethod: .post, completionHandler: { result in
            switch result {
            case let .success(data):
                print("this part works in the api helper")
                completionHandler(.success(data))
            case let .failure(error):
                print("this part failed in the api helper")
                completionHandler(.failure(error))
            }
        })
    }
    
    
    
    func getParticipants(object: String, completionHandler: @escaping (Result<[Participants], AppError>) -> () ) {
        
        var participantURL: URL {
            guard let url = URL(string: "https://raffle-fs-app.herokuapp.com/api/raffles/\(object)/participants") else { fatalError("Error: Invalid URL")}
            return url
        }
        
        NetworkHelper.manager.performDataTask(withUrl: participantURL, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
                return
            case .success(let data):
                do{
                    let participantData = try JSONDecoder().decode([Participants].self, from: data)
                    completionHandler(.success(participantData))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
    func postParticipants(object: String, _ participant: ParticipantWrapper, completionHandler: @escaping (Result<Data, AppError>) -> Void) {
        
        var participantURL: URL {
            guard let url = URL(string: "https://raffle-fs-app.herokuapp.com/api/raffles/\(object)/participants") else { fatalError("Error: Invalid URL")}
            return url
        }
        
        //let participantWrapper = ParticipantWrapper(participant: participant)
        guard let encodedParticipantWrapper = try? JSONEncoder().encode(participant) else {
            fatalError("Unable to json encode project")
        }
        print(String(data: encodedParticipantWrapper, encoding: .utf8)!)
        NetworkHelper.manager.performDataTask(withUrl: participantURL, andHTTPBody: encodedParticipantWrapper, andMethod: .post, completionHandler: { result in
            switch result {
            case let .success(data):
                print("yay it worked")
                completionHandler(.success(data))
            case let .failure(error):
                print("yah missing something hun")
                completionHandler(.failure(error))
            }
        })
    }
    
    func getWinner(object: String, completionHandler: @escaping (Result<[Winner], AppError>) -> () ) {
        
        var winnerURL: URL {
            guard let url = URL(string: "https://raffle-fs-app.herokuapp.com/api/raffles/\(object)/winner") else { fatalError("Error: Invalid URL")}
            return url
        }
        
        NetworkHelper.manager.performDataTask(withUrl: winnerURL, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
                return
            case .success(let data):
                do{
                    let winnerData = try JSONDecoder().decode([Winner].self, from: data)
                    completionHandler(.success(winnerData))
                } catch {
                    completionHandler(.failure(.couldNotParseJSON(rawError: error)))
                }
            }
        }
    }
    
    
    
    func setWinner(object: String, _ winner: WinnerWrapper, completionHandler: @escaping (Result<Data, AppError>) -> Void) {
        
        var winnerURL: URL {
            guard let url = URL(string: "https://raffle-fs-app.herokuapp.com/api/raffles/\(object)/winner") else { fatalError("Error: Invalid URL")}
            return url
        }
        
        //let participantWrapper = ParticipantWrapper(participant: participant)
        guard let encodedWinnerWrapper = try? JSONEncoder().encode(winner) else {
            fatalError("Unable to json encode project")
        }
        print(String(data: encodedWinnerWrapper, encoding: .utf8)!)
        NetworkHelper.manager.performDataTask(withUrl: winnerURL, andHTTPBody: encodedWinnerWrapper, andMethod: .put, completionHandler: { result in
            switch result {
            case let .success(data):
                print("yay it worked")
                completionHandler(.success(data))
            case let .failure(error):
                print("yah missing something hun")
                completionHandler(.failure(error))
            }
        })
    }
    
    private var raffleURL: URL {
        guard let url = URL(string: "https://raffle-fs-app.herokuapp.com/api/raffles") else { fatalError("Error: Invalid URL")}
        return url
    }
    
    
    private init() {}
}
