import SwiftUI

struct CreateFriendView: View {
    @State var friendName = ""
    @State var friendDetails = ""
    @Binding var friends: [Friend]
    
    @Environment(\.presentationMode) var presentationMode
    //dismiss stuff
    
    var body: some View {
        Form {
            Section {
                TextField("Please enter a name for your friend", text: $friendName)
                TextField("Details", text: $friendDetails)
            }
            Button("Save") {
                friends.append(Friend(name: friendName, details: friendDetails))
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
