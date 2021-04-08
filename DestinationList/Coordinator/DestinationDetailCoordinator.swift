//
//  DestinationDetailCoordinator.swift
//  DestinationList
//
//  Created by Tiago Carvalho on 08/04/2021.
//

import UIKit

protocol DestinationDetailCoordinatorProtocol {
    
    func navigateToList()
    
}

final class DestinationDetailCoordinator: NSObject, DestinationDetailCoordinatorProtocol {
    
    let presentingController: UIViewController
    
    // MARK: - INITIALIZATION
    
    init(presentingController: UIViewController) {
        self.presentingController = presentingController
    }
    
    func navigateToList() {
        presentingController.dismiss(animated: true, completion: nil)
    }

}
