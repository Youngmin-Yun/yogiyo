//
//  ContentView.swift
//  yogiyo
//
//  Created by 윤영민 on 2023/06/14.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm: YogigyoViewModel
    
    
    // HomeView로 가져온 식당 목록에 대한 것을 매개변수로 전달해야해서 State를 사용하여 배열 생성
    @State private var pick: [YogiyoModel] = []
    
    // viewModel을 초기화 하고 view가 호출될때마다 새롭게 업데이트를 위해 init 설정
    init() {
        vm = YogigyoViewModel()
        vm.fetchData()
    }
    
    var body: some View {
        // 상단 타이틀을 위해 네비게이션뷰를 통해 설정
        NavigationView() {
            // ScrollView를 통해서 리스트 항목들이 화면을 벗어나더라도 스크롤을 해서 확인 할 수 있도록 설정
            ScrollView(.vertical) {
                VStack(spacing: 10) {
                    ForEach(vm.yogiList) { list in
                        // 좋아요가 눌렸을 때 해당 뷰로에도 동일한 입력값을 전달
                        RestaurantListView(restaurant: list, pick: $pick)
                    }
                }
                .padding(.vertical)
            } //: ScrollView
            .navigationTitle("요기요") // 상단 타이틀
            .navigationBarTitleDisplayMode(.inline) // navigationTitle의 형태 설정
        } //: NavigationView
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
