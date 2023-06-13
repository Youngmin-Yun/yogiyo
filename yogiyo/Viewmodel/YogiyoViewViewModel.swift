//
//  YogiyoViewViewModel.swift
//  yogiyo
//
//  Created by 윤영민 on 2023/06/14.
//

import SwiftUI

class YogigyoViewModel: ObservableObject {
    // view와의 바인딩을 시켜주기 위해 published사용
    @Published var yogiList: [YogiyoModel] = []
    
    // API호출을 위한 함수 구현
    func fetchData() {
        // 모든 페이지의 데이터를 담을 배열
        var allYogiList: [YogiyoModel] = []
        
        // url이 숫자로 3페이지로 구분되어 있어서 해당 하는 url을 모두 호출되어야함
        for pageNum in 1...3 {
            guard let url = URL(string: "https://beomcheol.github.io/ios-codding-test-resources/restaurants/\(pageNum)/restaurant.json") else {
                continue
            }
            
            let session: URLSession = URLSession(configuration: .default)
            
            session.dataTask(with: url) { data, response, error in
                if let hasData = data {
                    do {
                        let list = try JSONDecoder().decode([YogiyoModel].self, from: hasData)
                        
                        DispatchQueue.main.async {
                            // 페이지 데이터를 전체 배열에 추가
                            allYogiList.append(contentsOf: list)
                            // 페이지 번호가 3이 되었을때는 allYogiList에 담긴것 모두를 yogiList로 담아준다
                            if pageNum == 3 {
                                self.yogiList = allYogiList
                                print(self.yogiList.count)
                            }
                        }
                    } catch {
//                        print("error: ", error)
                    }
                }
            }.resume()
        }
    }
    
    // 함수를 통해 Double의 소숫점을 소숫점 첫째자리까지면 표출되도록 함수 구현
    func convert(_ num: Double) -> String {
        let decimal = num
        let rate = String(format: "%.1f", decimal)
        return rate
    }
    
}
