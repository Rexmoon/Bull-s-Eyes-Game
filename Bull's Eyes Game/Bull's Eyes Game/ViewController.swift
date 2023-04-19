//
//  ViewController.swift
//  Bull's Eyes Game
//
//  Created by Rexmoon on 4/1/23.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private var slider: UISlider!
    @IBOutlet private var targetLabel: UILabel!
    @IBOutlet private var scoreLabel: UILabel!
    @IBOutlet private var roundLabel: UILabel!
    
    // MARK: - Properties
    private var currentSliderValue: Int = 0
    private var targetValue: Int = 0
    private var score: Int = 0
    private var rounds: Int = 0

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGameAction()
    }
    
    // MARK: - IBActions
    @IBAction private func showAlertAction() {
        let difference: Int = abs(currentSliderValue - targetValue)
        let points: Int = 100 - difference
        
        score += points
        rounds += 1
        
        let message = """
            The value of slider is \(currentSliderValue)
            The target value is: \(targetValue)
            The difference is: \(difference)
            You scored \(points) points
        """
        
        var title: String {
            switch difference {
                case 0:
                    score += 100
                    return "Perfect 100 additional points!"
                case 1..<10: return "You almost had it!"
                case 10..<15: return "Pretty good"
                default: return "Not even close!"
            }
        }
        
        let alertController = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok",
                                        style: .default) { [self] _ in
            startNewRound()
        }
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction private func movedSliderAction(_ slider: UISlider) {
        currentSliderValue = lroundf(slider.value)
    }
    
    @IBAction private func startNewGameAction() {
        rounds = 0
        score = 0
        startNewRound()
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
        scoreLabel.text = "\(score)"
        roundLabel.text = "\(rounds)"
    }
}
