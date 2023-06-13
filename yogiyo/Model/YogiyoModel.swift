//
//  YogiyoModel.swift
//  yogiyo
//
//  Created by 윤영민 on 2023/06/14.
//

import SwiftUI

struct Yogiyo: Codable {
    let isAvailablePickup: Bool
    let logoUrl: String
    let name: String
    let deliverymethod: String
    let isPhoneOrderAvailable: Bool
    let reviewCount: Int
    let ownerReplyCount: Int
    let sectionTitle: String
    let reviewAvg: Double
    let payment: [String]
    
}

//{
//    "isAvailablePickup": false,
//    "logoUrl": "https://raw.githubusercontent.com/beomcheol/ios-codding-test-resources/master/thumbnails/롯데리아_20200428_Franchise_crop_200x200.jpg",
//    "name": "롯데리아-남부터미널점",
//    "deliveryMethod": "OD",
//    "isPhoneOrderAvailable": true,
//    "reviewCount": 707,
//    "ownerReplyCount": 0,
//    "sectionTitle": "우리동네 플러스",
//    "reviewAvg": 4.7,
//    "payment": [
//        "yogiseo",
//        "offline"]
//}
