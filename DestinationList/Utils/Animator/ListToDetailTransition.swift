//
//  ListToDetailTransition.swift
//  DestinationList
//
//  Created by Tiago Carvalho on 08/04/2021.
//

import UIKit

final class ListToDetailTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    static let duration: TimeInterval = 0.8

    private let selectedCell: DestinationCell?
    private let firstViewController: DestinationListViewController
    private let secondViewController: DestinationDetailViewController
    private var selectedCellImageViewSnapshot: UIView
    
    private let cellImageViewRect: CGRect
    private let cellNameRect: CGRect
    private let cellDateRect: CGRect
    private let cellStateRect: CGRect

    init?(firstViewController: DestinationListViewController, secondViewController: DestinationDetailViewController, selectedCell: DestinationCell?, selectedCellImageViewSnapshot: UIView) {
        self.selectedCell = selectedCell
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
        self.selectedCellImageViewSnapshot = selectedCellImageViewSnapshot

        guard let window = firstViewController.view.window ?? secondViewController.view.window,
            let selectedCell = selectedCell
            else { return nil }

        self.cellImageViewRect = selectedCell.backgroundImageView.convert(selectedCell.backgroundImageView.bounds, to: window)
        self.cellNameRect = selectedCell.placeLabel.convert(selectedCell.placeLabel.bounds, to: window)
        self.cellDateRect = selectedCell.dateLabel.convert(selectedCell.dateLabel.bounds, to: window)
        self.cellStateRect = selectedCell.stateImageView.convert(selectedCell.stateImageView.bounds, to: window)
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let toView = secondViewController.view
        else {
            transitionContext.completeTransition(false)
            return
        }
        
        containerView.addSubview(toView)
        
        guard
            let selectedCell = selectedCell,
            let window = firstViewController.view.window ?? secondViewController.view.window,
            let cellImageSnapshot = selectedCell.backgroundImageView.snapshotView(afterScreenUpdates: true),
            let controllerImageSnapshot = secondViewController.backgroundImageView.snapshotView(afterScreenUpdates: true),
            let cellNameLabelSnapshot = selectedCell.placeLabel.snapshotView(afterScreenUpdates: true),
            let cellIconSnapshot = selectedCell.stateImageView.snapshotView(afterScreenUpdates: true),
            let cellDateLabelSnapshot = selectedCell.dateLabel.snapshotView(afterScreenUpdates: true),
            let closeButtonSnapshot = secondViewController.backButton.snapshotView(afterScreenUpdates: true),
            let detailsContainerSnapshot = secondViewController.descriptionContainer.snapshotView(afterScreenUpdates: true)
        else {
            transitionContext.completeTransition(true)
            return
        }
        
        let backgroundView: UIView
        let fadeView = UIView(frame: containerView.bounds)
        fadeView.backgroundColor = secondViewController.view.backgroundColor
        
        selectedCellImageViewSnapshot = cellImageSnapshot
        
        backgroundView = UIView(frame: containerView.bounds)
        backgroundView.addSubview(fadeView)
        fadeView.alpha = 0
        
        toView.alpha = 0
        [backgroundView, selectedCellImageViewSnapshot, controllerImageSnapshot, cellNameLabelSnapshot, cellIconSnapshot, cellDateLabelSnapshot, closeButtonSnapshot, detailsContainerSnapshot].forEach { containerView.addSubview($0) }
        
        let controllerImageViewRect = secondViewController.backgroundImageView.convert(secondViewController.backgroundImageView.bounds, to: window)
        let controllerNameLabelRect = secondViewController.placeLabel.convert(secondViewController.placeLabel.bounds, to: window)
        let controllerDateLabelRect = secondViewController.dateLabel.convert(secondViewController.dateLabel.bounds, to: window)
        let controllerIconRect = secondViewController.stateImageView.convert(secondViewController.stateImageView.bounds, to: window)
        
        let controllerCloseButtonRect = secondViewController.backButton.convert(secondViewController.backButton.bounds, to: window)
        let controllerDetailContainer = secondViewController.descriptionContainer.convert(secondViewController.descriptionContainer.bounds, to: window)
        
        [selectedCellImageViewSnapshot, controllerImageSnapshot].forEach {
            $0.frame =  cellImageViewRect
            
            $0.layer.cornerRadius = 12
            $0.layer.masksToBounds = true
        }
        
        controllerImageSnapshot.alpha = 0
        selectedCellImageViewSnapshot.alpha = 1
        cellNameLabelSnapshot.frame = cellNameRect
        cellDateLabelSnapshot.frame = cellDateRect
        cellIconSnapshot.frame = cellStateRect
        
        closeButtonSnapshot.frame = controllerCloseButtonRect
        closeButtonSnapshot.alpha = 0
        
        detailsContainerSnapshot.frame = controllerDetailContainer
        detailsContainerSnapshot.transform = .init(translationX: 0, y: (window.frame.height / 3))
        detailsContainerSnapshot.alpha = 0
        
        UIView.animateKeyframes(withDuration: Self.duration, delay: 0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.selectedCellImageViewSnapshot.alpha = 0
                controllerImageSnapshot.alpha = 1
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.8) {
                self.selectedCellImageViewSnapshot.frame = controllerImageViewRect
                controllerImageSnapshot.frame = controllerImageViewRect
                fadeView.alpha = 1
                cellNameLabelSnapshot.frame = controllerNameLabelRect
                cellDateLabelSnapshot.frame = controllerDateLabelRect
                cellIconSnapshot.frame = controllerIconRect
                
                [controllerImageSnapshot, self.selectedCellImageViewSnapshot].forEach {
                    $0.layer.cornerRadius = 0
                }
                
                detailsContainerSnapshot.transform = .identity
                detailsContainerSnapshot.alpha = 1
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
                closeButtonSnapshot.alpha = 1
            }
        }, completion: { _ in
            self.selectedCellImageViewSnapshot.removeFromSuperview()
            controllerImageSnapshot.removeFromSuperview()
            backgroundView.removeFromSuperview()
            cellNameLabelSnapshot.removeFromSuperview()
            cellIconSnapshot.removeFromSuperview()
            cellDateLabelSnapshot.removeFromSuperview()
            closeButtonSnapshot.removeFromSuperview()
            detailsContainerSnapshot.removeFromSuperview()
            toView.alpha = 1
            transitionContext.completeTransition(true)
        })
    }
}
