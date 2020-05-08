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
        NotificationCenter.default.addObserver(self, selector: #selector(preferredContentSizeChanged(_:)), name: UIContentSizeCategory.didChangeNotification, object: nil)
    }

    private var webView = WKWebView()
    private var useCustomFont = true
    
    private func notifyFontSize(newSize:CGFloat) {
        let javascriptFunction = "fontSizeChanged(\(newSize))"
        webView.evaluateJavaScript(javascriptFunction) { (result, error) in
            print("font size changed in webview")
        }
    }
    
    @objc private func preferredContentSizeChanged(_ notification: Notification) {
        if let userInfo = notification.userInfo,
            let contentSize = userInfo["UIContentSizeCategoryNewValueKey"] {
            print("new category \(contentSize) type = \(type(of: contentSize))")
        }
        let font = UIFont.preferredFont(forTextStyle: .body)
        if useCustomFont {
            notifyFontSize(newSize: font.pointSize)
        }
        else {
            webView.reload()
        }
        
    }
}


