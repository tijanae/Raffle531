//
//  WinnerView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class WinnerView: UIView {

    lazy var raffleName: UILabel = {
        let label = UILabel()
        label.text = "Win A PONY"
        label.textColor = .black
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var winnerLabel: UILabel = {
        let label = UILabel()
        label.text = "Select Winner"
        label.textColor = .black
        return label
    }()
    
    lazy var tokenField: UITextField = {
        let text = UITextField()
        text.text = " Enter token"
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
        raffleNameConstraint()
        winnerLabelConstraint()
        tokenFieldConstraint()
        submitButtonConstraint()
        cancelButtonConstraint()
    }
    
    private func raffleNameConstraint() {
        addSubview(raffleName)
        
        raffleName.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleName.topAnchor.constraint(equalTo: topAnchor, constant: 50 ),
         raffleName.bottomAnchor.constraint(equalTo: topAnchor, constant: 75),
         raffleName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         //raffleName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
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
        
        [tokenField.topAnchor.constraint(equalTo: topAnchor, constant: 200 ),
         tokenField.bottomAnchor.constraint(equalTo: topAnchor, constant: 250),
         tokenField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         tokenField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func submitButtonConstraint() {
        addSubview(submitButton)
        
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        
        [submitButton.topAnchor.constraint(equalTo: topAnchor, constant: 550 ),
         submitButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 600),
         submitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
         submitButton.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 275)].forEach {$0.isActive = true}
        
    }
    
    private func cancelButtonConstraint() {
        addSubview(cancelButton)
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        
        [cancelButton.topAnchor.constraint(equalTo: topAnchor, constant: 150 ),
         cancelButton.bottomAnchor.constraint(equalTo: topAnchor, constant: 175),
         cancelButton.leadingAnchor.constraint(equalTo: trailingAnchor, constant: -75),
         cancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach {$0.isActive = true}
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
