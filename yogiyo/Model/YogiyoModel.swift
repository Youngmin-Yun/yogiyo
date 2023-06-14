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
    var id: String {name}
    enum logo {
        case logo
    }
    // priview 샘플
    static let sampleYogiyo = YogiyoModel(isAvailablePickup: false, logoUrl: "https://raw.githubusercontent.com/beomcheol/ios-codding-test-resources/master/thumbnails/롯데리아_20200428_Franchise_crop_200x200.jpg", name: "롯데리아-남부터미널점", deliveryMethod: "OD", isPhoneOrderAvailable: true, reviewCount: 707, ownerReplyCount: 0, sectionTitle: "우리동네 플러스", reviewAvg: 4.7, payment: ["yogiseo", "offline"])
    
}

// 검색 중 찾은 것으로 찜을 했을때 넘기기 위해서 사용했다
// equatable 프로토콜을 채택하여 함수 구현시 ==를 반드시 정의 해주어야 하는데
// 해당 부분은 이해가 되지 않는다.
extension YogiyoModel: Equatable {
    static func == (lhs: YogiyoModel, rhs: YogiyoModel) -> Bool {
        return lhs.id == rhs.id
    }
}
