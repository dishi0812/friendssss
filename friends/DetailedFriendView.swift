//
//  FriendsDetailedView.swift
//  friends
//
//  Created by Tham En Jie on 9/7/22.
//

import SwiftUI

struct DetailedFriendView: View {
    
    @Binding var friendElement: Friend
    
    var body: some View {
        VStack {
            VStack {
                if UIImage(systemName: friendElement.icon) != nil {
                    Image(systemName: friendElement.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                }
                Text(friendElement.name)
                    .font(.largeTitle)
                    .bold()
            }
            .padding(.vertical)
            .padding(.bottom)
            Text(friendElement.details)
                .font(.subheadline)
                .padding()
            Spacer()
        }
    }
}

struct FriendsDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedFriendView(friendElement: .constant(Friend(name: "Name", details: "Details Details Details", icon: "person.circle.fill")))
    }
}
