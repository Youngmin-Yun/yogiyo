//
//  YogiyoViewViewModel.swift
//  yogiyo
//
//  Created by 윤영민 on 2023/06/14.
//

import SwiftUI

class YogigyoViewModel: ObservableObject {
    // view와의 바인딩을 시켜주기 위해 published사용
    @Published var yogiList = [YogiyoModel]()
    
    func fetchData(completion: @escaping (YogiyoModel) -> Void) {
        guard let url = URL(string: "https://beomcheol.github.io/ios-codding-test-resources/restaurants/1/restaurant.json") else {
            return
        }
        
        let session: URLSession = URLSession(configuration: .default)
        
        session.dataTask(with: url){ data, response, errer in
            if let hasData = data {
                do{
                    let yogiyo = try JSONDecoder().decode(YogiyoModel.self, from: hasData)
                    completion(yogiyo)
                }catch {
                    print("decode error", error)
                }
            }
        }.resume()
    }
    
    func convert(_ num: Double) -> String {
        let decimal = num
        let rate = String(format: "%.1f", decimal)
        return rate
    }
    
}
