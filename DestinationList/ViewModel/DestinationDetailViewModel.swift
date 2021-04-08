//
//  DestinationDetailViewModel.swift
//  DestinationList
//
//  Created by Tiago Carvalho on 08/04/2021.
//

import Foundation

protocol DestinationDetailViewModelProtocol {
    
    func getContent() -> DestinationObject
    func goBack()
}

final class DestinationDetailViewModel: DestinationDetailViewModelProtocol {
    
    let coordinator: DestinationDetailCoordinatorProtocol
    
    private var destination: DestinationObject
    
    init(coordinator: DestinationDetailCoordinatorProtocol, destination: DestinationObject) {
        self.coordinator = coordinator
        self.destination = destination
    }
    
    func getContent() -> DestinationObject {
        return destination
    }
    
    func goBack() {
        coordinator.navigateToList()
    }
}
