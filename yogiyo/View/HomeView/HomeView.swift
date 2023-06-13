//
//  ContentView.swift
//  yogiyo
//
//  Created by 윤영민 on 2023/06/14.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm: YogigyoViewModel
    
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
                        RestaurantListView(restaurant: list)
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
