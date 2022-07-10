//
//  FriendsDetailedView.swift
//  friends
//
//  Created by Tham En Jie on 9/7/22.
//

import SwiftUI

struct DetailedFriendView: View {
    
    @Binding var friendElement: Friend
    @State var isEditing = false
    
    @State var friendName = ""
    @State var friendDetails = ""
    @State var friendIcon = ""
    
    var body: some View {
        VStack {
            VStack {
                if UIImage(systemName: isEditing ? friendIcon : friendElement.icon) != nil {
                    Image(systemName: isEditing ? friendIcon : friendElement.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                } else {
                    Spacer()
                        .frame(height: 150)
                }
                if isEditing {
                    TextField("Edit SF Symbol Icon of Friend", text: $friendIcon)
                        .textInputAutocapitalization(.never)
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal)
                        .padding(.horizontal)
                    TextField("Edit Name of Friend", text: $friendName)
                        .font(Font.largeTitle.bold())
                        .multilineTextAlignment(.center)
                        .background(Color(UIColor.systemGray6))
                        .cornerRadius(5)
                        .padding(.horizontal)
                } else {
                    Text(friendElement.name)
                        .font(.largeTitle)
                        .bold()
                }
            }
            .padding(.vertical)
            .padding(.bottom)
            if isEditing {
                TextEditor(text: $friendDetails)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .cornerRadius(5)
                    .padding()
                    .background(Color(UIColor.systemGray6))
            } else {
                Text(friendElement.details)
                    .font(.body)
                    .padding()
            }
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if isEditing {
                        friendElement.name = friendName
                        friendElement.details = friendDetails
                        friendElement.icon = friendIcon
                    } else {
                        friendName = friendElement.name
                        friendDetails = friendElement.details
                        friendIcon = friendElement.icon
                    }
                    isEditing.toggle()
                } label: {
                    if isEditing {
                        Text("Save")
                    } else {
                        Text("Edit")
                    }
                }
            }
        }
    }
}

struct FriendsDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedFriendView(friendElement: .constant(Friend(name: "Name", details: "Details Details Details", icon: "person.circle.fill")))
    }
}
