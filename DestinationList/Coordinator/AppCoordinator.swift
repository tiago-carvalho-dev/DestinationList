//
//  AppCoordinator.swift
//  DestinationList
//
//  Created by Tiago Carvalho on 08/04/2021.
//

import UIKit

protocol AppCoordinatorProtocol {
    
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
        
        start()
    }
    
    private func start() {
        guard let window = window else {
            return
        }
        
        let viewController = DestinationListViewController()
        viewController.viewModel = DestinationListViewModel(coordinator: DestinationListCoordinator(presentingController: viewController))
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
}
