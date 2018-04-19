//
//  HelpViewController.swift
//  OpenWeatherMap
//
//  Created by Karim Ihab on 4/19/18.
//  Copyright © 2018 Karim Ihab. All rights reserved.
//

import UIKit
import WebKit

class HelpViewContoller: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Help"

        let htmlPath = Bundle.main.path(forResource: "help", ofType: "html")
        guard let path = htmlPath else { return }
        let htmlUrl = URL(fileURLWithPath: path, isDirectory: false)
        webView.loadFileURL(htmlUrl, allowingReadAccessTo: htmlUrl)
        
    }
}
