//
//  PageChat.swift
//  KakaoTalk-mimic
//
//  Created by ksum on 2023/01/30.
//

import SwiftUI

struct PageChat: View {
    var body: some View {
        return TupleView(
            NavigationView{
                List{
                    Group{
                        ChatPreset(userProfileImage: "아이유", userName: "아이유", chatPreview: "사진이 도착했습니다.", msgTime: "10분전", receivedMsg: "2", leftMsg: false)
                        ChatPreset(userProfileImage: "있지", userName: "있지", chatPreview: "아", msgTime: "어제", receivedMsg: "5", leftMsg: false)
                        ChatPreset(userProfileImage: "오마이걸", userName: "오마이걸", chatPreview: "(광고)카카오가 준비한 할인 이벤트!", msgTime: "어제", receivedMsg: "1", leftMsg: true)
                        ChatPreset(userProfileImage: "블랙핑크", userName: "블랙핑크", chatPreview: "(배달안내) 고객님이 주문하신 음식이 약 30분 내에 도착할 예정", msgTime: "어제", receivedMsg: "1", leftMsg: true)
                            
                    } // Group 1
                    Group{
                        ChatPreset(userProfileImage: "뉴진스", userName: "뉴진스", chatPreview: "1.", msgTime: "어제", receivedMsg: "1", leftMsg: true)
                        ChatPreset(userProfileImage: "에스파", userName: "에스파", chatPreview: "카카오계정 로그인", msgTime: "어제", receivedMsg: "1", leftMsg: true)
                    }
                    
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("Chat").font(.title)
                    }
                }
                .listStyle(SidebarListStyle())
                .navigationTitle("")
            }
            
        )
    }
}

struct PageChat_Previews: PreviewProvider {
    static var previews: some View {
        PageChat()
    }
}

struct ChatPreset: View {
    
    var userProfileImage: String
    var userName: String
    var chatPreview: String
    var msgTime: String
    var receivedMsg: String
    var leftMsg: Bool
    
    var body: some View {
        HStack{
            Image(userProfileImage)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
                .frame(width: 60, height: 60)
            VStack(alignment: .leading){
                Text(userName)
                    .font(.system(size: 18))
                    .padding(.bottom, 3)
                Text(chatPreview)
                    .lineLimit(2)
                    .foregroundColor(.secondary)
                    .font(.system(size: 15))
            } // VStack 1
            
            Spacer()
            
            switch leftMsg{ // false 일 때 아이콘 있음, true 일 때 아이콘 없음
            case false:
                VStack(alignment: .trailing){
                    Text(msgTime)
                        .foregroundColor(.secondary)
                        .font(.system(size: 13))
                        .padding(.leading, 20)
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.red)
                        .overlay(
                        Text(receivedMsg)
                            .foregroundColor(.white)
                            .font(.system(size: 12))
                        )
                } // VStack 2
            default:
                VStack(alignment: .trailing){
                    Text(msgTime)
                        .foregroundColor(.secondary)
                        .font(.system(size: 13))
                        .padding(.leading, 20)
                } // VStack 2
            }
            

        } // 제일 바깥 HStack
    }
}

