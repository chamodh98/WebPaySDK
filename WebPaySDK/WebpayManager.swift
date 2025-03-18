//
//  WebpayManager.swift
//  WebPaySDK
//
//  Created by Chamod Hettiarachchi on 2025-03-17.
//

import Foundation
import UIKit

public class WebpayManager {
    public static func webPay(from parentViewController: UIViewController, with urlString: String, completion: @escaping (String?) -> Void) { // @escaping indicates that the closure might be called after the function returns
        let webVC = WebViewController()
        webVC.webUrl = urlString
        webVC.completionHandler = completion
        webVC.modalPresentationStyle = .currentContext
        parentViewController.present(webVC, animated: true)
    }
    
}
