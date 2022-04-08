//
//  Cell.swift
//  AnimationsHomework
//
//  Created by Рустем on 07.04.2022.
//

import Foundation
import UIKit

class Cell: UIView {
    
    // MARK: - UI Outlets
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Functions
    func configure(image: UIImage, title: String) {
        backgroundImageView.image = image
        backgroundImageView.alpha = 0.55
        titleLabel.text = title
        
    }
}
