//
//  friends struct.swift
//  friends
//
//  Created by Lindsey Choo on 9/7/22.
//

import Foundation
import SwiftUI

struct Friend: Identifiable{
    
    var id = UUID()
    var name: String
    var details: String
    var icon: String
    
}

