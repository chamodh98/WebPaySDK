//
//  WebpayManager.swift
//  WebPaySDK
//
//  Created by Chamod Hettiarachchi on 2025-03-17.
//

import Foundation
import UIKit

public class WebpayManager {
    public static func webPay(from parentViewController: UIViewController, with urlString: String, paymentData: PaymentData, completion: @escaping (String?) -> Void) { // @escaping indicates that the closure might be called after the function returns
        let webVC = WebViewController()
        webVC.webUrl = urlString
        webVC.completionHandler = completion
        webVC.paymentData = setRequestData(data: paymentData)
        webVC.modalPresentationStyle = .currentContext
        parentViewController.present(webVC, animated: true)
    }
    
    private static func setRequestData(data: PaymentData) -> RequestData {
        var requestData = RequestData()
        if data.packageName != "" {
            requestData.packageName = data.packageName
        }
        if data.paymentMethod != "" {
            requestData.paymentMethod = data.paymentMethod
        }
        if data.merchantWebToken != "" {
            requestData.merchantWebToken = data.merchantWebToken
        }
        if data.orderId != "" {
            requestData.orderId = data.orderId
        }
        if data.orderDescription != "" {
            requestData.orderDescription = data.orderDescription
        }
        if data.returnUrl != "" {
            requestData.returnUrl = data.returnUrl
        }
        if data.cancelUrl != "" {
            requestData.cancelUrl = data.cancelUrl
        }
        if data.subMerchantReference != "" {
            requestData.subMerchantReference = data.subMerchantReference
        }
        if data.totalAmount != "" {
            requestData.totalAmount = data.totalAmount
        }
        if data.customerName != "" {
            requestData.customerName = data.customerName
        }
        if data.customerPhone != "" {
            requestData.customerPhone = data.customerPhone
        }
        if data.customerEmail != "" {
            requestData.customerEmail = data.customerEmail
        }
        return requestData
    }
    
}
