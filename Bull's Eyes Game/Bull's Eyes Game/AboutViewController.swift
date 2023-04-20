//
//  AboutViewController.swift
//  Bull's Eyes Game
//
//  Created by Rexmoon on 4/20/23.
//

import UIKit
import WebKit

final class AboutViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private var webView: WKWebView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setWebView()
    }
    
    // MARK: - Functions
    private func setWebView() {
        guard let url = Bundle.main.url(forResource: "about",
                                        withExtension: "html") else { return }
        webView.load(URLRequest(url: url))
    }
    
    // MARK: - IBActions
    @IBAction private func dismiss() {
        dismiss(animated: true)
    }
}
