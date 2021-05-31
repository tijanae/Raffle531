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
        label.font = UIFont(name: "GillSans-UltraBold", size: 30)
        return label
    }()
    
    lazy var cancelRaffle: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    
    var RaffleNameTF = RaffleTextField(placeholder: "Raffle Name")
    
    var secrectTokenTF = RaffleTextField(placeholder: "Secret Token")
    
    lazy var textSecureButton: UIButton = {
       let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        return button
    }()
    
    lazy var submitButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
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
        textSecureButtonConstraint()
        submitButtonConstraint()
        
       
    }
    
    private func raffleTitleConstraint() {
        addSubview(raffleTitle)
        
        raffleTitle.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleTitle.topAnchor.constraint(equalTo: topAnchor, constant: 75 ),
         raffleTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ].forEach {$0.isActive = true}
    }
    
    private func cancelRaffleConstraint() {
        addSubview(cancelRaffle)
        
        cancelRaffle.translatesAutoresizingMaskIntoConstraints = false
        
        [cancelRaffle.topAnchor.constraint(equalTo: topAnchor, constant: 85),
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
    
    private func textSecureButtonConstraint() {
        addSubview(textSecureButton)
        
        textSecureButton.translatesAutoresizingMaskIntoConstraints = false
        
        [textSecureButton.topAnchor.constraint(equalTo: secrectTokenTF.topAnchor),
         textSecureButton.bottomAnchor.constraint(equalTo: secrectTokenTF.bottomAnchor),
         textSecureButton.leadingAnchor.constraint(equalTo: secrectTokenTF.trailingAnchor, constant: -50),
         textSecureButton.trailingAnchor.constraint(equalTo: secrectTokenTF.trailingAnchor, constant: -10)].forEach{$0.isActive = true}
    }
    
    private func submitButtonConstraint() {
        addSubview(submitButton)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        [submitButton.topAnchor.constraint(equalTo: topAnchor, constant: 350 ),
         submitButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 400),
         submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
         submitButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 275)].forEach {$0.isActive = true}
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
