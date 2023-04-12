//
//  ViewController.swift
//  Bull's Eyes Game
//
//  Created by Rexmoon on 4/1/23.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    @IBAction private func showAlert() {
        let alertController = UIAlertController(title: "Controller Title",
                                      message: "Controller Message",
                                      preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Action Title",
                                        style: .cancel,
                                        handler: nil)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
}
