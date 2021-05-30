//
//  ParticipantView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class ParticipantView: UIView {

    //    MARK: UIOBJECTS
    
    lazy var cancelView: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    lazy var raffleName: UILabel = {
        let label = UILabel()
        label.text = "Raffle Name"
        label.textColor = .black
        return label
    }()
    
    lazy var participantTV: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.register(participantTVC.self, forCellReuseIdentifier: "participantTable")
        return table
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints() {
        raffleNameConstraint()
        cancelViewConstraint()
        playlistTVConstraint()
        
    }
    
    private func raffleNameConstraint() {
        addSubview(raffleName)
        
        raffleName.translatesAutoresizingMaskIntoConstraints = false
        
        [raffleName.topAnchor.constraint(equalTo: topAnchor, constant: 50),
         raffleName.bottomAnchor.constraint(equalTo: topAnchor, constant: 150),
         raffleName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)].forEach {$0.isActive = true}
    }
    
    private func cancelViewConstraint() {
        addSubview(cancelView)
        
        cancelView.translatesAutoresizingMaskIntoConstraints = false
        
        [cancelView.topAnchor.constraint(equalTo: topAnchor, constant: 150),
         cancelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)].forEach {$0.isActive = true}
    }
    
    private func playlistTVConstraint() {
        addSubview(participantTV)
        
        participantTV.translatesAutoresizingMaskIntoConstraints = false
        
        //   [participantTV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        //         participantTV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        //         participantTV.leadingAnchor.constraint(equalTo: leadingAnchor),
        //         participantTV.trailingAnchor.constraint(equalTo: trailingAnchor)].forEach{$0.isActive = true}
        
        NSLayoutConstraint.activate(
            [participantTV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
             participantTV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
             participantTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
             participantTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)])
    }

}
