//
//  YogiyoModel.swift
//  yogiyo
//
//  Created by 윤영민 on 2023/06/14.
//

import SwiftUI

struct YogiyoModel: Codable, Identifiable {
    let isAvailablePickup: Bool
    let logoUrl: String
    let name: String
    let deliveryMethod: String
    let isPhoneOrderAvailable: Bool
    let reviewCount: Int
    let ownerReplyCount: Int
    let sectionTitle: String
    let reviewAvg: Double
    let payment: [String]
    
    // name을 통해 식별자로 이용
    var id: String { name }
    
    // priview 샘플
    static let sampleYogiyo = YogiyoModel(isAvailablePickup: false, logoUrl: "https://raw.githubusercontent.com/beomcheol/ios-codding-test-resources/master/thumbnails/롯데리아_20200428_Franchise_crop_200x200.jpg", name: "롯데리아-남부터미널점", deliveryMethod: "OD", isPhoneOrderAvailable: true, reviewCount: 707, ownerReplyCount: 0, sectionTitle: "우리동네 플러스", reviewAvg: 4.7, payment: ["yogiseo", "offline"])
    
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
//    "payment": ["yogiseo", "offline"]
//}
