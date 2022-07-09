//
//  friendsApp.swift
//  friends
//
//  Created by T Krobot on 9/7/22.
//

import SwiftUI

struct ContentView: View {
    @State var friends = [
        Friends(name: "Felix", details: "a person that plays games"),
        Friends(name: "Jing Xian", details: "Jing Xian is Jing Xian (math moment)"),
        Friends(name: "Lindsey", details: "1cm taller than vanisha!"),
        Friends(name: "En Jie", details: "am late"),
        Friends(name: "Regina", details: "needs coffee"),
        Friends(name: "Dishita", details: "can swim")
    ]
         
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
//                            CreateFriendView()
                        } label: {
                            Image(systemName: "plus")
                        }

                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
