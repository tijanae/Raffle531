//
//  noSavedWatchListView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/31/21.
//

import UIKit

class noSavedWatchListView: UIView {

    //    MARK: UIOBJECTS
    
    lazy var savedLabel: UILabel = {
        let label = UILabel()
        label.text = "Favorited Raffles Show Here"
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
        savedLabelConstraint()
        
    }
    
    private func savedLabelConstraint() {
        addSubview(savedLabel)
        
        savedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [savedLabel.topAnchor.constraint(equalTo: topAnchor, constant: 75 ),
         savedLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 150),
         savedLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
         //savedLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }

}
