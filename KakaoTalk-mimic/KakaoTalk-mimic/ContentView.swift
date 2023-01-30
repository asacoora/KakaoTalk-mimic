//
//  ContentView.swift
//  KakaoTalk-mimic
//
//  Created by ksum on 2023/01/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            PageFriends()
                .tabItem{
                    Text("Friends")
                }
            PageChat()
                .tabItem{
                    Text("Chat")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
