//
//  DestinationListViewModel.swift
//  DestinationList
//
//  Created by Tiago Carvalho on 08/04/2021.
//

import UIKit

protocol DestinationListViewModelProtocol {
    
    func getNumberOfDestinations() -> Int
    func getDestinationFor(indexPath: IndexPath) -> DestinationObject
    func goToDetail(selectedCell: DestinationCell?, indexPath: IndexPath)
    
}

final class DestinationListViewModel {
    
    let coordinator: DestinationListCoordinatorProtocol
    
    private var destinations: [DestinationObject]
    
    init(coordinator: DestinationListCoordinatorProtocol) {
        self.coordinator = coordinator
        
        destinations = [DestinationObject(name: "Croatia", image: UIImage(imageLiteralResourceName: "croatia"), date: "Summer 2017 - 14 days", stateImage: UIImage(imageLiteralResourceName: "summer"), descriptionTitle: "The best holiday in Croatia", descriptionBody: "Croatia is a country somewhere in Europe, never been there but its said to be cool, this is a place where magic can happen."),
                        DestinationObject(name: "Warsaw", image: UIImage(imageLiteralResourceName: "warsaw"), date: "Spring 2017 - 3 days", stateImage: UIImage(imageLiteralResourceName: "spring"), descriptionTitle: "The best holiday in Warsaw", descriptionBody: "Warsaw is a country somewhere in Europe, never been there but its said to be cool, this is a place where magic can happen."),
                        DestinationObject(name: "Les Berthelots", image: UIImage(imageLiteralResourceName: "les_berthelots"), date: "Summer 2016 - 10 days", stateImage: UIImage(imageLiteralResourceName: "summer"), descriptionTitle: "The best holiday in Les Berthelots", descriptionBody: "Les Berthelots is a country somewhere in Europe, never been there but its said to be cool, this is a place where magic can happen."),
                        DestinationObject(name: "Kappl", image: UIImage(imageLiteralResourceName: "kappl"), date: "Winter 2016 - 8 days", stateImage: UIImage(imageLiteralResourceName: "winter"), descriptionTitle: "The best holiday in Kappl", descriptionBody: "Kappl is a country somewhere in Europe, never been there but its said to be cool, this is a place where magic can happen."),
                        DestinationObject(name: "Rotterdam", image: UIImage(imageLiteralResourceName: "rotterdam"), date: "Spring 2015 - 3 days", stateImage: UIImage(imageLiteralResourceName: "spring"), descriptionTitle: "The best holiday in Rotterdam", descriptionBody: "Rotterdam is a country somewhere in Europe, never been there but its said to be cool, this is a place where magic can happen."),
                        DestinationObject(name: "Porto", image: UIImage(imageLiteralResourceName: "porto"), date: "Summer 2014 - 14 days", stateImage: UIImage(imageLiteralResourceName: "summer"), descriptionTitle: "The best holiday in Porto", descriptionBody: "Porto is a country somewhere in Europe, never been there but its said to be cool, this is a place where magic can happen.")]
    }
}

extension DestinationListViewModel: DestinationListViewModelProtocol {
    
    func goToDetail(selectedCell: DestinationCell?, indexPath: IndexPath) {
        coordinator.navigateDetails(selectedCell: selectedCell, destination: destinations[indexPath.row])
    }
    
    func getNumberOfDestinations() -> Int {
        return destinations.count
    }
    
    func getDestinationFor(indexPath: IndexPath) -> DestinationObject {
        return destinations[indexPath.row]
    }
    
}
