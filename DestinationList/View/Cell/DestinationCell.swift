//
//  DestinationCell.swift
//  DestinationList
//
//  Created by Tiago Carvalho on 08/04/2021.
//

import UIKit

final class DestinationCell: UICollectionViewCell {
    
    var backgroundImageView: UIImageView!
    
    var stateImageView: UIImageView!
    var placeLabel: UILabel!
    var dateLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    func setContent(_ destination: DestinationObject) {
        placeLabel.text = destination.name
        dateLabel.text = destination.date
        stateImageView.image = destination.stateImage
        backgroundImageView.image = destination.image
    }
    
    // MARK: - Common initializer
    
    fileprivate func commonInit() {
        layer.cornerRadius = 16
        layer.borderWidth = 0.5
        clipsToBounds = true
        layer.borderColor = UIColor.black.cgColor
        
        backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        
        stateImageView = UIImageView()
        stateImageView.translatesAutoresizingMaskIntoConstraints = false
        stateImageView.contentMode = .scaleAspectFit
        stateImageView.tintColor = .white
        
        placeLabel = UILabel()
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.font = .boldSystemFont(ofSize: 24)
        placeLabel.textColor = .white
        placeLabel.textAlignment = .left
        
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .left
        
        [backgroundImageView, stateImageView, placeLabel, dateLabel].forEach { addSubview($0) }
        
        backgroundImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        stateImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        stateImageView.bottomAnchor.constraint(equalTo: placeLabel.topAnchor, constant: -12).isActive = true
        stateImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        stateImageView.widthAnchor.constraint(equalTo: stateImageView.heightAnchor).isActive = true
        
        placeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        placeLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -8).isActive = true
        placeLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -24).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        dateLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -32).isActive = true
    }
        
}
