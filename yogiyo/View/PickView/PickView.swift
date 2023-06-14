//
//  PickView.swift
//  yogiyo
//
//  Created by 윤영민 on 2023/06/14.
//

import SwiftUI

struct PickView: View {
    // 식당 리스트에서 전달 받은 pick을 배열 사용
    @State private var pick: [YogiyoModel] = []
    
    var body: some View {
        // 상단 타이틀을 위해 네비게이션뷰를 통해 설정
        NavigationView {
            // ScrollView를 통해서 리스트 항목들이 화면을 벗어나더라도 스크롤을 해서 확인 할 수 있도록 설정
            if pick.isEmpty {
                VStack{
                    Text("찜한 음식점이 없습니다.")
                        .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height, alignment: .center)
                }//: VStack
                .navigationTitle("찜") // 상단 타이틀
                .navigationBarTitleDisplayMode(.inline) // navigationTitle의 형태 설정
            } else  {
                ScrollView {
                    VStack {
                        ForEach(pick) { restaurant in
                            RestaurantListView(restaurant: restaurant, pick: $pick)
                        }
                    }
                }
            }
        } //: NavigationView
        .onAppear {
            // UserDefaults에서 pick 데이터 가져오기
            if let data = UserDefaults.standard.data(forKey: "pick") {
                if let decodedData = try? JSONDecoder().decode([YogiyoModel].self, from: data) {
                    pick = decodedData
                }
            }
        }
    }
}

struct PickView_Previews: PreviewProvider {
    static var previews: some View {
        PickView()
    }
}
