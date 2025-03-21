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
        WebpayManager.webPay(from: self, with: "http://34.87.71.190:80/ipg/checkout/sdk/init/ios", paymentData: setPaymentData()) { messageBody in
            if let message = messageBody {
                print("Response from the parent app which receieved from SDK: \(message)")
            }
            
        }
    }
    
    func setPaymentData() -> PaymentData {
        let paymentData = PaymentData()
        paymentData.merchantWebToken = "eyJhbGciOiJIUzUxMiJ9.eyJtaWQiOiIwMDAwMTg5NCJ9.u1OqIhWsZ0_ceQmdZQyWBrfiP6A5mjACzuxbitRLp1K8DwMF5ehkKEyzSpWtQXyhbqqcyOFHWS-X28zy3hfbMw"
        paymentData.orderId = "OID123456"
        paymentData.orderDescription = "Order Description"
        paymentData.totalAmount = "150.00"
        paymentData.customerName = "John Doe"
        paymentData.customerPhone = "1234567890"
        paymentData.customerEmail = "test@email.com"
        return paymentData
    }
}

