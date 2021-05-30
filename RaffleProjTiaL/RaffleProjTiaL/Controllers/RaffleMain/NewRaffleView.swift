//
//  NewRaffleView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class NewRaffleView: UIView {
    
    //MARK: UIObject
    
    lazy var raffleTitle: UILabel = {
       let label = UILabel()
        label.text = "Summer Raffles"
        label.textColor = .black
        //label.contentMode = .scaleToFill
        //label.numberOfLines = 2
        return label
    }()
    
    lazy var cancelRaffle: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var RaffleNameTF: UITextField = {
        let text = UITextField()
        text.text = "Raffle Name"
        text.backgroundColor = .black
        text.borderStyle = .line
//        text.font = UIFont(name: "Damascus", size: 10)
        text.textColor = .white
        text.layer.borderWidth = 2
        text.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return text
       }()
    
    lazy var secrectTokenTF: UITextField = {
        let text = UITextField()
        text.text = "Secret Token"
        text.backgroundColor = .black
        text.borderStyle = .line
//        text.font = UIFont(name: "Damascus", size: 10)
        text.textColor = .white
        text.layer.borderWidth = 2
        text.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return text
       }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Submit", for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    
    
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        addConstraints()
        
    }
    
    //MARK: Private Func
    
    private func addConstraints() {
        raffleTitleConstraint()
        cancelRaffleConstraint()
        raffleNameTFConstraint()
        secrectTokenTFConstraint()
        submitButtonConstraint()
        
       
    }
    
    private func raffleTitleConstraint() {
        addSubview(raffleTitle)
        
        raffleTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleTitle.topAnchor.constraint(equalTo: topAnchor, constant: 50 ),
         raffleTitle.bottomAnchor.constraint(equalTo: topAnchor, constant: 75),
         raffleTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         //raffleTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func cancelRaffleConstraint() {
        addSubview(cancelRaffle)
        
        cancelRaffle.translatesAutoresizingMaskIntoConstraints = false
        
        [cancelRaffle.topAnchor.constraint(equalTo: topAnchor, constant: 150),
         //cancelRaffle.bottomAnchor.constraint(equalTo: topAnchor, constant: 50),
         //cancelRaffle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 200),
         cancelRaffle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)].forEach {$0.isActive = true}
    }
    
    private func raffleNameTFConstraint() {
        addSubview(RaffleNameTF)
        
        RaffleNameTF.translatesAutoresizingMaskIntoConstraints = false
        
        [RaffleNameTF.topAnchor.constraint(equalTo: topAnchor, constant: 200 ),
         RaffleNameTF.bottomAnchor.constraint(equalTo: topAnchor, constant: 250),
         RaffleNameTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         RaffleNameTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func secrectTokenTFConstraint() {
        addSubview(secrectTokenTF)
        
        secrectTokenTF.translatesAutoresizingMaskIntoConstraints = false
        
        [secrectTokenTF.topAnchor.constraint(equalTo: topAnchor, constant: 275 ),
         secrectTokenTF.bottomAnchor.constraint(equalTo: topAnchor, constant: 325),
         secrectTokenTF.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         secrectTokenTF.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func submitButtonConstraint() {
        addSubview(submitButton)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        [submitButton.topAnchor.constraint(equalTo: topAnchor, constant: 450 ),
         submitButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 475),
         submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
         submitButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 175)].forEach {$0.isActive = true}
        
    }
    
    
    
    


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
