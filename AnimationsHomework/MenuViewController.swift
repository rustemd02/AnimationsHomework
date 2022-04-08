//
//  ViewController.swift
//  AnimationsHomework
//
//  Created by Рустем on 07.04.2022.
//

import UIKit

class MenuViewController: UIViewController {
    
    // MARK: - UI Outlets
    
    @IBOutlet var cellView: UIView!
    
    // MARK: - Properties
    
    var selectedCellImageViewSnapshot: UIView?
    var animator: Animator?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cellView.layer.cornerRadius = 20
        let tapGesture = UITapGestureRecognizer()
        self.view.addGestureRecognizer(tapGesture)
        tapGesture.addTarget(self, action: #selector(cellClick))
        
        (cellView as? Cell)!.configure(image: UIImage(named: "lamp") ?? UIImage(), title: "Управление освещением в умном доме")
    }
    
    // MARK: - Functions
    
    @IBAction func cellClick(_ sender: UITapGestureRecognizer) {
        presentLampControlVC()
    }
    
    
    func presentLampControlVC() {
        let lampControlSB = UIStoryboard(name: "Main", bundle: nil)
        let lampControlVC = lampControlSB.instantiateViewController(withIdentifier: "LampControlViewController") as! LampControlViewController
        let selectedCell = cellView as? Cell
        selectedCellImageViewSnapshot = selectedCell?.backgroundImageView.snapshotView(afterScreenUpdates: false)
        
        lampControlVC.transitioningDelegate = self
        
        lampControlVC.modalPresentationStyle = .fullScreen
        present(lampControlVC, animated: true)
    }
    
}

// MARK: - Transitioning Delegate

extension MenuViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let menuVC = presenting as? MenuViewController,
              let lampControlVC = presented as? LampControlViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        else { return nil }
        
        animator = Animator(type: .present, menuViewController: menuVC, lampControlViewController: lampControlVC, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        guard let lampControlVC = dismissed as? LampControlViewController,
              let selectedCellImageViewSnapshot = selectedCellImageViewSnapshot
        else { return nil }
        
        animator = Animator(type: .dismiss, menuViewController: self, lampControlViewController: lampControlVC, selectedCellImageViewSnapshot: selectedCellImageViewSnapshot)
        return animator
    }
}

