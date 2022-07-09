//
//  ContentView.swift
//  friends
//
//  Created by T Krobot on 9/7/22.
//

import SwiftUI

import SwiftUI

struct FriendsOverview: View {
    @State var friends = [
        Friend(name: "Felix", details: "a person that plays games"),
        Friend(name: "Jing Xian", details: "Jing Xian is Jing Xian (math moment)"),
        Friend(name: "Lindsey", details: "1cm taller than vanisha!"),
        Friend(name: "En Jie", details: "am late"),
        Friend(name: "Regina", details: "needs coffee"),
        Friend(name: "Dishita", details: "can swim"),
        Friend(name: "Jolie", details: "Hobby is playing badminton")
    ]
    @State var createFriend = false
         
    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(friends) { friend in
                        NavigationLink {
//                            FriendDetailView()
                        } label: {
                            HStack {
                                Image(systemName: "trash")
                                VStack(alignment: .leading) {
                                    Text(friend.name)
                                    Text(friend.details)
                                        .font(.subheadline)
                                        .opacity(0.8)
                                }
                            }
                        }
                    }
                    .onDelete { indexSet in
                        friends.remove(atOffsets: indexSet)
                    }
                    .onMove { indices, newOffset in
                        friends.move(fromOffsets: indices, toOffset: newOffset)
                    }
                }
                .navigationTitle("Friends")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            createFriend = true
                        } label: {
                            Image(systemName: "plus")
                        }

                    }
                }
            }
        }
        .sheet(isPresented: $createFriend) {
            CreateFriendView(friends: $friends)
        }
    }
}


struct FriendsOverview_Previews: PreviewProvider {
    static var previews: some View {
        FriendsOverview()
    }
}
