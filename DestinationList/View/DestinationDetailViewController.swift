//
//  DestinationDetailViewController.swift
//  DestinationList
//
//  Created by Tiago Carvalho on 08/04/2021.
//

import UIKit

final class DestinationDetailViewController: UIViewController {
    
    var viewModel: DestinationDetailViewModelProtocol!
    
    var backButton: UIButton!
    
    var backgroundImageView: UIImageView!
    var stateImageView: UIImageView!
    var placeLabel: UILabel!
    var dateLabel: UILabel!
    
    var descriptionContainer: UIView!
    var titleDescriptionLabel: UILabel!
    var bodyDescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createView()
        
        populateView()
    }
    
    private func populateView() {
        let content = viewModel.getContent()
        
        backgroundImageView.image = content.image
        stateImageView.image = content.stateImage
        placeLabel.text = content.name
        dateLabel.text = content.date
        titleDescriptionLabel.text = content.descriptionTitle
        bodyDescriptionLabel.text = content.descriptionBody
    }
    
    @objc func backTapped() {
        viewModel.goBack()
    }
}

// MARK: - View Creation

extension DestinationDetailViewController {
    
    func createView() {
        backButton = UIButton(type: .custom)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        backButton.layer.cornerRadius = 22
        backButton.tintColor = .white
        backButton.backgroundColor = UIColor(white: 1, alpha: 0.3)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        backButton.setImage(UIImage(imageLiteralResourceName: "close"), for: .normal)
        
        backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        
        stateImageView = UIImageView()
        stateImageView.translatesAutoresizingMaskIntoConstraints = false
        stateImageView.contentMode = .scaleAspectFit
        stateImageView.tintColor = .white
        
        placeLabel = UILabel()
        placeLabel.translatesAutoresizingMaskIntoConstraints = false
        placeLabel.font = .boldSystemFont(ofSize: 36)
        placeLabel.textColor = .white
        placeLabel.textAlignment = .left
        
        dateLabel = UILabel()
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = .systemFont(ofSize: 18)
        dateLabel.textColor = .white
        dateLabel.textAlignment = .left
        
        descriptionContainer = UIView()
        descriptionContainer.translatesAutoresizingMaskIntoConstraints = false
        descriptionContainer.backgroundColor = .white
        descriptionContainer.layer.cornerRadius = 24
        descriptionContainer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        titleDescriptionLabel = UILabel()
        titleDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        titleDescriptionLabel.font = .boldSystemFont(ofSize: 20)
        titleDescriptionLabel.textColor = .black
        titleDescriptionLabel.textAlignment = .left
        titleDescriptionLabel.numberOfLines = 0
        
        bodyDescriptionLabel = UILabel()
        bodyDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyDescriptionLabel.font = .systemFont(ofSize: 16)
        bodyDescriptionLabel.textColor = .lightGray
        bodyDescriptionLabel.textAlignment = .left
        bodyDescriptionLabel.numberOfLines = 0
        
        [backgroundImageView, stateImageView, placeLabel, dateLabel, descriptionContainer, backButton].forEach { view.addSubview($0) }
        [titleDescriptionLabel, bodyDescriptionLabel].forEach { descriptionContainer.addSubview($0) }
        
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
        
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        stateImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        stateImageView.bottomAnchor.constraint(equalTo: placeLabel.topAnchor, constant: -24).isActive = true
        stateImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        stateImageView.widthAnchor.constraint(equalTo: stateImageView.heightAnchor).isActive = true
        
        placeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        placeLabel.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -8).isActive = true
        placeLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -24).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: descriptionContainer.topAnchor, constant: -36).isActive = true
        dateLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -24).isActive = true
        
        descriptionContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        descriptionContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        descriptionContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        descriptionContainer.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        
        titleDescriptionLabel.topAnchor.constraint(equalTo: descriptionContainer.topAnchor, constant: 32).isActive = true
        titleDescriptionLabel.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor, constant: 12).isActive = true
        titleDescriptionLabel.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor, constant: -12).isActive = true
        
        bodyDescriptionLabel.topAnchor.constraint(equalTo: titleDescriptionLabel.bottomAnchor, constant: 4).isActive = true
        bodyDescriptionLabel.leadingAnchor.constraint(equalTo: descriptionContainer.leadingAnchor, constant: 12).isActive = true
        bodyDescriptionLabel.trailingAnchor.constraint(equalTo: descriptionContainer.trailingAnchor, constant: -12).isActive = true
        bodyDescriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: descriptionContainer.bottomAnchor, constant: -32).isActive = true
    }
}
