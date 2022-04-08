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
    }
    
    func configure() {
        self.view.backgroundColor = #colorLiteral(red: 0.3468268812, green: 0.3016859591, blue: 0.19334355, alpha: 1)
    }
    
    func sliderAnimation() {
        animator.addAnimations {
            self.view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
    }
    
    


}
