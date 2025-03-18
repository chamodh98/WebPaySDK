//
//  ViewController.swift
//  TestSDK
//
//  Created by Chamod Hettiarachchi on 2025-03-18.
//

import UIKit
import WebPaySDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTapPay(_ sender: Any) {
        WebpayManager.webPay(from: self, with: "https://chamodh98.github.io/TestSigleWeb?param1=122&param2=675") { messageBody in
            if let message = messageBody {
                print("Response from the parent app which receieved from SDK: \(message)")
            }
            
        }
    }
    
}

