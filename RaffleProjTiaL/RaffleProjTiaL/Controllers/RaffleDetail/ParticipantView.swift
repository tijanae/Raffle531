//
//  ParticipantView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class ParticipantView: UIView {

    //    MARK: UIOBJECTS
    
    lazy var participantTV: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.register(participantTVC.self, forCellReuseIdentifier: "participantTable")
        return table
    }()
    
    lazy var participantLabel: UILabel = {
        let label = UILabel()
        label.text = "Be the first to register"
        label.font = UIFont(name: "GillSans-UltraBold", size: 20)
        label.textColor = .black
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints() {
        playlistTVConstraint()
        participantLabelConstraint()
        
    }
    
    private func participantLabelConstraint() {
        addSubview(participantLabel)
        
        participantLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [participantLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50 ),
         participantLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 75),
         participantLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         //participantLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
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
