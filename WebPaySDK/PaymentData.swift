//
//  PaymentData.swift
//  WebPaySDK
//
//  Created by Chamod Hettiarachchi on 2025-03-21.
//

import Foundation

struct RequestData: Codable {
    var packageName: String = ""
    var paymentMethod: String = ""
    var merchantWebToken: String = ""
    var orderId: String = ""
    var orderDescription: String = ""
    var returnUrl: String = ""
    var cancelUrl: String = ""
    var subMerchantReference: String = ""
    var totalAmount: String = ""
    var customerName: String = ""
    var customerPhone: String = ""
    var customerEmail: String = ""
}

public class PaymentData: NSObject {
    public var packageName: String = ""
    public var paymentMethod: String = ""
    public var merchantWebToken: String = ""
    public var orderId: String = ""
    public var orderDescription: String = ""
    public var returnUrl: String = ""
    public var cancelUrl: String = ""
    public var subMerchantReference: String = ""
    public var totalAmount: String = ""
    public var customerName: String = ""
    public var customerPhone: String = ""
    public var customerEmail: String = ""
}
