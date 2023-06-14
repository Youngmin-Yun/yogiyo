//
//  RestaurantListView.swift
//  yogiyo
//
//  Created by 윤영민 on 2023/06/14.
//

import SwiftUI

struct RestaurantListView: View {
    // property
    let restaurant: YogiyoModel
    @State var like: Bool = false
    @Binding var pick: [YogiyoModel] // Binding을 통해서 pickView로 넘어갈 수 있게끔 설정
    
    var body: some View {
        // 전체적으로 가로 베치를 위한 HStack
        HStack {
            // 로고 이미지 호출

            Image(restaurant.logoUrl)
                .frame(width: 100, height: 100)
                .background(Color.blue)
                .padding(.leading, 10)
            Spacer()
            // 중심 내용 세로 배치를 위한 VStack
            VStack(spacing: 20){
                // 상호명 불러오기
                Text(restaurant.name)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .frame(width: 220, height: 5, alignment: .leading)
                    .padding(.top)
                    .gridCellAnchor(.leading)
                    
                // 상호명 아래 가로 배치를 위한 HStack
                HStack(spacing: 20){
                    
                    // 리뷰 갯수가 없을 경우 별 및 평점이 필요 없음
                    if restaurant.reviewCount != 0 {
                    // 별 이미지 불러오기 - sf symbols
                        Group{
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
//                                .padding(.trailing, -20)
                                .background(Color.clear)
                                
                            // 기존 Double 타입의 리뷰 평점을 뷰모델에서 convert 함수를 통한 소수점 끊어서 표현
                                Text("\(YogigyoViewModel().convert(restaurant.reviewAvg))")
                                    .fontWeight(.bold)
                                    .foregroundColor(.yellow)
                        }
                        .padding(.leading, -20)
                        .frame(alignment: .leading)
                    
                    }
                    // 색상 변화가 없는 것이라 Group으로 묶어서 한번에 설정
                    Group{
                        Image(systemName: "text.bubble.fill")
                            .padding(.leading, -15)
                        // 리뷰 갯수가 없을 경우
                        if restaurant.reviewCount == 0 {
                            Text("첫번째 리뷰를 남겨주세요!")
                                .font(.caption2)
                                .padding(.leading, -20)
                        } else {
                            // 리뷰 갯수가 있을 경우
                            Text(". 리뷰 \(restaurant.reviewCount)")
                                .padding(.leading, -20)
                        }
                        // 사장님의 댓글이 없는경우 공란으로 출력
                        if restaurant.ownerReplyCount == 0 {
                            Text("")
                                .frame(width: 50)
                        } else {
                            // 사장님의 댓글이 있는 경우 갯수 출력
                            Text(". 사장님댓글 \(restaurant.ownerReplyCount)")
                                .padding(.leading, -20)
                        }
                        
                    } //:Group
                    .foregroundColor(Color.gray)
                    .frame(alignment: .leading)

                }//: HStack
                // Hstac의 폰트 크기와 패딩값 수정
                .font(.system(size: 14))
                .frame(width: 200, height: 10)
                
                // 아랫줄 표현을 위한 HStack
                HStack{
                    // 동일 부분 그룹으로 지정하여 한번에 변경
                    Group{
                        // 전화주문이 가능 할 경우 표출
                        if restaurant.isPhoneOrderAvailable {
                            Text("전화주문")
                                .frame(width: 50)
                        }
                        
                        // 해당 두 부분은 배열을 통해서 가져오기 때문에 공부가 좀 필요할 듯
                        Text("요기서결제")
                            .frame(width: 50)
                        Text("현장결제")
                            .frame(width: 50)
                        
                        // 테이크아웃이 가능할 경우 표출
                        if restaurant.isAvailablePickup {
                            Text("테이크아웃")
                                .frame(width: 50)
                        }
                        
                    }
                    .font(.system(size: 10))
                    .foregroundColor(Color.gray)
                    .background(
                        Rectangle()
                            .stroke(Color.gray, lineWidth: 3)
                            .foregroundColor(Color.clear)
                            .cornerRadius(10)
                    )//: Group
                }//: HStack
                // HStack의 위치 수정
                .padding(.top, -5)
                .padding(.bottom, 5)
                .padding(.leading, 20)
                
                // 해당하는 배달 방법이 맞을 경우
                if restaurant.deliveryMethod == "OD" || restaurant.deliveryMethod == "OD/VD" {
                    // 다음줄 표현을 위한 HStack 선언
                    HStack{
                        Text("익스프레스")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.leading, 30)
                            .background(
                                // 캡슐로 표현하여 둥근 사각형 생성
                                Capsule()
                                    .stroke(Color.red, lineWidth: 2.5)
                                    .padding(.leading, 25)
                                    .padding(.trailing, -5)
                            )
                    }//: HStack
                    .padding(.top, -15)
                    .frame(width: 250, alignment: .leading)
                }
                
            }//: VStack
            .padding(.leading, -20)
            Spacer()
            // 찜 버튼을 위한 부분
            Button {
                // 좋아요가 눌려지면 true 값으로 바꿔서 배열에 들어갈 수 있게 설정
                like.toggle()
                if like {
                    // 찜한 음식점 배열에 추가
                    pick.append(restaurant)
                } else {
                    // false 값이 생기면 찜한 음식점 배열에서 제거
                    if let index = pick.firstIndex(of: restaurant) {
                        pick.remove(at: index)
                    }
                }
                
                // UserDefaults에 업데이트된 pick 배열 저장
                let data = try? JSONEncoder().encode(pick)
                UserDefaults.standard.set(data, forKey: "pick")
            } label: {
                Image(systemName: like ? "suit.heart.fill" : "suit.heart")
                    .padding(.trailing, 20)
                    .foregroundColor(like ? Color.red : Color.gray) // 좋아요 눌렸을때의 색변화
            }
        }//: HStack
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    @State static var pick: [YogiyoModel] = [YogiyoModel.sampleYogiyo]
    
    static var previews: some View {
        RestaurantListView(restaurant: YogiyoModel.sampleYogiyo, pick: $pick)
    }
}
