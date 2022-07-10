import SwiftUI

struct CreateFriendView: View {
    @State var friendName = ""
    @State var friendDetails = ""
    @State var friendIcon = ""
    @Binding var friends: [Friend]
    
    @Environment(\.presentationMode) var presentationMode
    //dismiss stuff
    
    var body: some View {
        Form {
            Section {
                TextField("Name for your friend", text: $friendName)
                TextField("Details of your friend", text: $friendDetails)
                HStack {
                    if UIImage(systemName: friendIcon) != nil {
                        Image(systemName: friendIcon)
                    }
                    TextField("SF Symbol for your friend", text: $friendIcon)
                        .textInputAutocapitalization(.never)
                }
            }
            Button("Save") {
                friends.append(Friend(name: friendName, details: friendDetails, icon: friendIcon))
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct CreateFriendView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFriendView(friends: .constant([]))
    }
}
