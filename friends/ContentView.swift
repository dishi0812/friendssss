//
//  ContentView.swift
//  friends
//
//  Created by T Krobot on 9/7/22.
//

import SwiftUI

struct ContentView: View {
    
    var friends = [Friends(name: "Jolie"),
                   Friends(name: "En Jie"),
                   Friends(name: "Regina"),
                   Friends(name: "Lindsey"),
                   Friends(name: "Felix"),
                   Friends(name: "Dishita"),
                   Friends(name: "Jing Xian")]
    
    var body: some View {
        List(friends) { friend in
            Text(friend.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
