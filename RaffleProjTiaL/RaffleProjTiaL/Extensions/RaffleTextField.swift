//
//  RaffleTextField.swift
//  RaffleProjTiaL
//
//  Created by Tia Lendor on 5/29/21.
//

import UIKit

class RaffleTextField: UITextField {
    
    override init(frame: CGRect){
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(placeholder: String) {
        self.init(frame: .zero)
//        self.placeholder = placeholder
        self.text = placeholder
        configure()
    }
    
    var textPadding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
           let rect = super.textRect(forBounds: bounds)
           return rect.inset(by: textPadding)
       }

       override func editingRect(forBounds bounds: CGRect) -> CGRect {
           let rect = super.editingRect(forBounds: bounds)
           return rect.inset(by: textPadding)
       }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            let rect = super.placeholderRect(forBounds: bounds)
            return rect.inset(by: textPadding)
        }
    
    private func configure() {
        backgroundColor = .black
        borderStyle = .line
        textColor = .white
        layer.borderWidth = 2
        layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
