//
//  ViewController.swift
//  OurWebView
//
//  Created by 123 on 16.11.23.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    let webView: WKWebView = {
        let configuration = WKWebViewConfiguration()
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        configuration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(webView)
        
        guard let url = URL(string: "https://iosacademy.io") else {return}
        webView.load(URLRequest(url: url))
        webView.customUserAgent = "Ipad/Chrome/Iphone"
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.webView.evaluateJavaScript("document.body.innerHTML") { result, error in
                guard let html = result as? String, error == nil else {
                    return
                }
                print(html)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

}

