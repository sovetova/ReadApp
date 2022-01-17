//
//  WebViewReadController.swift
//  ReadApp
//
//  Created by Dilsh on 23.12.2021.
//

import UIKit
import WebKit

@available(iOS 14.0, *)
class WebViewReadController: UIViewController {
    
    private lazy var webView: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        
        return webView
    }()
    
    private let url: URL
    init(url:URL , title: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        self.title = title
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        webView.load(URLRequest(url: url))
        self.webView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/601.6.17 (KHTML, like Gecko) Version/9.1.1 Safari/601.6.17"
        configureButtonUI()
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    private func configureButtonUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(doneButtonTap))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refershButtonTap))
        
        
        
        
    }
    @objc func doneButtonTap() {
        dismiss(animated: true)
    }
    @objc func refershButtonTap() {
        webView.load(URLRequest(url: url))
    }
}
