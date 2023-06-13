//
//  TabBar.swift
//  yogiyo
//
//  Created by 윤영민 on 2023/06/14.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        // tabBar를 통해 최초 화면 분기를 위한 코드
        TabView (){
            
            // 1. 요기요 메인화면으로 가는 탭바
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("홈")
                }
            
            // 2. 찜 화면으로 가는 탭바
            PickView()
                .tabItem {
                    Image(systemName: "suit.heart")
                    Text("찜")
                }
            
        }//: TabView
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
