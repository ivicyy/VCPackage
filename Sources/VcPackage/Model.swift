//
//  Model.swift
//  
//
//  Created by 前端 on 2024/5/11.
//

import UIKit

struct Base<T:Codable>:Codable {
    var code:Int?
    var desc:String?
    var result:T?
}

struct SmsCode:Codable {
    var smsCode:String?
}
