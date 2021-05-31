//
//  WinnerView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class WinnerView: UIView {

    lazy var winnerLabel: UILabel = {
        let label = UILabel()
        label.text = "Select A Winner"
        label.font = UIFont(name: "GillSans-UltraBold", size: 20)
        label.textColor = .black
        return label
    }()
    
    var tokenField = RaffleTextField(placeholder: "Enter token")
    
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
        constraints()
        
    }
    
    //MARK: Private Funcs
    
    private func constraints() {
        winnerLabelConstraint()
        tokenFieldConstraint()
        submitButtonConstraint()
        textSecureButtonConstraint()
    }
    

    
    private func winnerLabelConstraint() {
        addSubview(winnerLabel)
        
        winnerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [winnerLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50 ),
         winnerLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 75),
         winnerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         //winnerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func tokenFieldConstraint() {
        addSubview(tokenField)
        
        tokenField.translatesAutoresizingMaskIntoConstraints = false
        
        [tokenField.topAnchor.constraint(equalTo: topAnchor, constant: 150 ),
         tokenField.bottomAnchor.constraint(equalTo: topAnchor, constant: 200),
         tokenField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         tokenField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func textSecureButtonConstraint() {
        addSubview(textSecureButton)
        
        textSecureButton.translatesAutoresizingMaskIntoConstraints = false
        
        [textSecureButton.topAnchor.constraint(equalTo: tokenField.topAnchor),
         textSecureButton.bottomAnchor.constraint(equalTo: tokenField.bottomAnchor),
         textSecureButton.leadingAnchor.constraint(equalTo: tokenField.trailingAnchor, constant: -50),
         textSecureButton.trailingAnchor.constraint(equalTo: tokenField.trailingAnchor, constant: -10)].forEach{$0.isActive = true}
    }
    
    private func submitButtonConstraint() {
        addSubview(submitButton)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        [submitButton.topAnchor.constraint(equalTo: topAnchor, constant: 250 ),
         submitButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 300),
         submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 145),
         submitButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 245)].forEach {$0.isActive = true}
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
