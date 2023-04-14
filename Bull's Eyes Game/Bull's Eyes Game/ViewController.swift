//
//  ViewController.swift
//  Bull's Eyes Game
//
//  Created by Rexmoon on 4/1/23.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - IBOtlets
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var targetLabel: UILabel!
    
    // MARK: - Properties
    private var currentSliderValue: Int = 0
    private var targetValue: Int = 0

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    // MARK: - IBActions
    @IBAction private func showAlert() {
        let message = """
            The value of slider is \(currentSliderValue)
            The target value os: \(targetValue)
        """
        
        let alertController = UIAlertController(title: "Success",
                                      message: message,
                                      preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok",
                                        style: .default,
                                        handler: nil)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction private func movedSlider(_ slider: UISlider) {
        currentSliderValue = lroundf(slider.value)
    }
    
    // MARK: - Functions
    private func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentSliderValue = 50
        slider.value = Float(currentSliderValue)
        updateLabels()
    }
    
    private func updateLabels() {
        targetLabel.text = "\(targetValue)"
    }
}
