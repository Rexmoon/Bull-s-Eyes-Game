//
//  ViewController.swift
//  Bull's Eyes Game
//
//  Created by Rexmoon on 4/1/23.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties
    private var currentSliderValue: Int = 50

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction private func showAlert() {
        let message = "The Slider value is \(currentSliderValue)"
        let alertController = UIAlertController(title: "Success",
                                      message: message,
                                      preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok",
                                        style: .default,
                                        handler: nil)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction private func movedSlider(_ slider: UISlider) {
        currentSliderValue = lroundf(slider.value)
    }
}
