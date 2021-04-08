//
//  DestinationListCoordinator.swift
//  DestinationList
//
//  Created by Tiago Carvalho on 08/04/2021.
//

import UIKit

protocol DestinationListCoordinatorProtocol {
    
    func navigateDetails(selectedCell: DestinationCell?, destination: DestinationObject)
    
}

final class DestinationListCoordinator: NSObject, DestinationListCoordinatorProtocol, UIViewControllerTransitioningDelegate {
    
    let presentingController: UIViewController
    
    var animator: ListToDetailTransition?
    
    var selectedCell: DestinationCell?
    var selectedCellImageViewSnapshot: UIView?
    
    // MARK: - INITIALIZATION
    
    init(presentingController: UIViewController) {
        self.presentingController = presentingController
    }
    
    func navigateDetails(selectedCell: DestinationCell?, destination: DestinationObject) {
        self.selectedCell = selectedCell
        selectedCellImageViewSnapshot = selectedCell?.backgroundImageView.snapshotView(afterScreenUpdates: false)
        
        let viewController = DestinationDetailViewController()
        viewController.transitioningDelegate = self
        viewController.viewModel = DestinationDetailViewModel(coordinator: DestinationDetailCoordinator(presentingController: viewController), destination: destination)
//        navigationController.pushViewController(viewController, animated: true)
        
        viewController.modalPresentationStyle = .fullScreen
        presentingController.present(viewController, animated: true)
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let firstViewController = presenting as? DestinationListViewController,
            let secondViewController = presented as? DestinationDetailViewController,
            let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
            else {
            return nil
        }

        animator = ListToDetailTransition(firstViewController: firstViewController, secondViewController: secondViewController, selectedCell: selectedCell, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        
        return animator
    }
    
}
