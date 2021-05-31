//
//  noParticipantsView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/31/21.
//

import UIKit

class noParticipantsView: UIView {

    //    MARK: UIOBJECTS
    
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

}
