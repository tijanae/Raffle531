//
//  RaffleDetailView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RaffleDetailView: UIView {
    
    //MARK: UIObjects
    
    lazy var raffleName: UILabel = {
        let label = UILabel()
        label.text = "Win A PONY"
        label.textColor = .black
        return label
    }()
    
    lazy var cancelRaffle: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Register", for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    lazy var participantsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Participants", for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var winnerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Winner", for: .normal)
        button.tintColor = .black
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addConstraints()
        
    }
    //MARK: PrivateFuncs
    
    private func addConstraints() {
        raffleNameConstraint()
        cancelRaffleConstraint()
        registerConstraint()
        participantsConstraint()
        winnerConstraint()
    }
    
    private func raffleNameConstraint() {
        addSubview(raffleName)
        
        raffleName.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleName.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         raffleName.bottomAnchor.constraint(equalTo: topAnchor, constant: 150),
         raffleName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)].forEach {$0.isActive = true}
    }
    
    private func cancelRaffleConstraint() {
        addSubview(cancelRaffle)
        
        cancelRaffle.translatesAutoresizingMaskIntoConstraints = false
        
        [cancelRaffle.topAnchor.constraint(equalTo: topAnchor, constant: 150),
         cancelRaffle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)].forEach {$0.isActive = true}
    }
    
    private func registerConstraint() {
        addSubview(registerButton)
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        [registerButton.topAnchor.constraint(equalTo: topAnchor, constant: 250),
         registerButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 300),
         registerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
         registerButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 125)].forEach {$0.isActive = true}
    }
    
    private func participantsConstraint() {
        addSubview(participantsButton)
        
        participantsButton.translatesAutoresizingMaskIntoConstraints = false
        
        [participantsButton.topAnchor.constraint(equalTo: topAnchor, constant: 250),
         participantsButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 300),
         participantsButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 145),
         participantsButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 245)].forEach {$0.isActive = true}
    }
    
    private func winnerConstraint() {
        addSubview(winnerButton)
        
        winnerButton.translatesAutoresizingMaskIntoConstraints = false
        
        [winnerButton.topAnchor.constraint(equalTo: topAnchor, constant: 250),
         winnerButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 300),
         winnerButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 285),
         winnerButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 385)].forEach {$0.isActive = true}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
