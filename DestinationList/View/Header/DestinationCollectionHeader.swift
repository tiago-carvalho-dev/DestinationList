//
//  DestinationCollectionHeader.swift
//  DestinationList
//
//  Created by Tiago Carvalho on 08/04/2021.
//

import UIKit

final class DestinationCollectionHeader: UICollectionReusableView {
    
    let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    private func commonInit() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 32)
        titleLabel.text = "My trips"
        titleLabel.textColor = .black
        
        addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
    }
}
