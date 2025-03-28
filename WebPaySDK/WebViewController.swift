//
//  WebViewController.swift
//  WebPaySDK
//
//  Created by Chamod Hettiarachchi on 2025-03-17.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var webView: WKWebView!
    var webUrl = String()
    var completionHandler: ((String?) -> Void)? //optional closure - This property stores the closure passed from WebpayManager
    var paymentData: RequestData?
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        let config = WKWebViewConfiguration()
        let userContentController = WKUserContentController()
        
        
        userContentController.add(self, name: "callbackHandler")
        config.userContentController = userContentController
        webView = WKWebView(frame: .zero, configuration: config)
        
        view.addSubview(webView)
        
        // Add a button to close the payment view
        let button = UIButton(type: .system)
        button.setTitle("Close Payment View", for: .normal)
        button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        view.addSubview(button)
        
        // set layout constraints of the web view
        let layoutGuide = view.safeAreaLayoutGuide
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: layoutGuide.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: button.topAnchor).isActive = true
        
        // set layout constraints of the button
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loadWeb()
    }
    
    
    private func loadWeb() {
        if let url = URL(string: webUrl) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            // Encode the payment data to JSON
            do {
                let jasonData = try JSONEncoder().encode(paymentData)
                request.httpBody = jasonData
                print("Payment data encoded successfully")
                print(paymentData)
                print(url)
            } catch {
                print("Error encoding the payment data")
                return
            }
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            print(request.httpBody)
            print(request.httpMethod)
            webView.load(request)
        }
    }
    
    @objc private func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func webViewCallBack(response: String) {
        
    }
}

extension WebViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "callbackHandler", let messageBody = message.body as? String {
            webViewCallBack(response: messageBody)
            print(messageBody)
            self.dismiss(animated: true) {
                self.completionHandler?(messageBody) // Call the completionHandler - The optional chaining ? ensures that the closure is only called if it exists.
            }
        }
    }
    
    
}
