//
//  LampControlViewController.swift
//  AnimationsHomework
//
//  Created by Рустем on 07.04.2022.
//

import UIKit

class LampControlViewController: UIViewController {
    
    
    // MARK: - UI Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var maxBrightnessLabel: UILabel!
    
    
    // MARK: - Properties
    var animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        sliderAnimation()
        
    }
    
    // MARK: - Functions
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(sender.value)
        if (sender.value == 1) {
            UIView.transition(with: maxBrightnessLabel,
                          duration: 0.25,
                           options: .transitionCrossDissolve,
                        animations: { [weak self] in
                self?.maxBrightnessLabel.alpha = 1
                self?.maxBrightnessLabel.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
                     }, completion: nil)
        } else {
            UIView.transition(with: maxBrightnessLabel,
                          duration: 0.25,
                           options: .transitionCrossDissolve,
                        animations: { [weak self] in
                self?.maxBrightnessLabel.alpha = 0
                self?.maxBrightnessLabel.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
                     }, completion: nil)
        }
    }
    
    func configure() {
        maxBrightnessLabel.alpha = 0
        self.view.backgroundColor = #colorLiteral(red: 0.3468268812, green: 0.3016859591, blue: 0.19334355, alpha: 1)
    }
    
    func sliderAnimation() {
        animator.addAnimations {
            self.view.backgroundColor = #colorLiteral(red: 0.7287805676, green: 0.6339904666, blue: 0.4052860141, alpha: 1)
            
        }
    }
    
    


}
