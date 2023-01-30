//
//  PageFriends.swift
//  KakaoTalk-mimic
//
//  Created by ksum on 2023/01/30.
//

import SwiftUI

struct PageFriends: View {
    var body: some View {
       
        
        
        
        let jsonData = loadFriendsData()
        let arrFriends = try! JSONDecoder().decode([FriendsListProfile].self, from: jsonData!)
            
        return TupleView(
            NavigationView{
                List{
                    Section(header: Text("내프로필")){
                        HStack{
                            Image("내프로필")
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                    //                        .padding(.trailing)
                                .frame(width: 50, height: 50)
                            Text("KSUM").frame(height: 35.0)
                            
                        }
                        
                        
                    }
                    Section(header: Text("친구")){
                        ForEach(0..<arrFriends.count){i in
                            AnyView(arrFriends[i])
                        }
                    }
                    
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Text("Friend").font(.title)
                    }
                }
                .listStyle(SidebarListStyle())
            }
            
        )
        
            
    }
}

struct PageFriends_Previews: PreviewProvider {
    static var previews: some View {
        PageFriends()
    }
}


struct FriendsListProfile : Codable,View{
    var name : String
//    var message : String
//    var profileImage : String
    var body : some View{
        HStack{
            Image(name)
                .resizable()
                .scaledToFill()
                .clipShape(Circle())
    //                        .padding(.trailing)
                .frame(width: 50, height: 50)
            Text(name).frame(height: 35.0)
            
        }
        
        
    }

    init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)
           name = try container.decode(String.self, forKey: .name)

    }
    init (name : String){
        self.name = name
    }
        
}

func loadFriendsData()->Data?{
    let fileNm: String = "FriendsData"
        
        let extensionType = "json"
        guard let fileLocation = Bundle.main.url(forResource: fileNm, withExtension: extensionType) else { return nil }
        
        do {
            
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {
            
            return nil
        }
}

