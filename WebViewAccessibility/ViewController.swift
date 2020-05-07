//
//  ViewController.swift
//  WebViewAccessibility
//
//  Created by Gualtiero Frigerio on 07/05/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        webView.frame = self.view.frame
        self.view.addSubview(webView)
        if let bundlePath = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "html") {
            let request = URLRequest(url: URL(fileURLWithPath: bundlePath))
            webView.load(request)
        }
    }

    private var webView = WKWebView()
}

