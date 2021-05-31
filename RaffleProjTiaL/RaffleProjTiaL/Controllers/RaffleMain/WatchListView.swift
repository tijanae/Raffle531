//
//  WatchListView.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/30/21.
//

import UIKit

class WatchListView: UIView {

    //MARK: UIObjects
    
    lazy var faveLabel: UILabel = {
       let label = UILabel()
        label.text = "Watch List"
        label.font = UIFont(name: "GillSans-UltraBold", size: 30)
        label.textColor = .black
        return label
    }()
    
    lazy var watchTV: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.register(WatchTVC.self, forCellReuseIdentifier: "watchListTable")
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    private func constraints() {
        faveLabelConstraint()
        watchTVConstraint()
    }
    
    private func faveLabelConstraint() {
        addSubview(faveLabel)
        
        faveLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [faveLabel.topAnchor.constraint(equalTo: topAnchor, constant: 75 ),
         faveLabel.bottomAnchor.constraint(equalTo: topAnchor, constant: 100),
         faveLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         //faveLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ].forEach {$0.isActive = true}
    }
    
    private func watchTVConstraint() {
        addSubview(watchTV)
        
        watchTV.translatesAutoresizingMaskIntoConstraints = false
        
        [watchTV.topAnchor.constraint(equalTo: topAnchor, constant: 150),
         watchTV.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
         watchTV.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         watchTV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)].forEach{$0.isActive = true}
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
