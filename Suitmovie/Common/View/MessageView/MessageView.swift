//
//  MessageView.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI

struct MessageView: View {
    var message: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Text(message)
                .foregroundColor(Color.gray)
                .fontWeight(.light).multilineTextAlignment(.center)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(message: "Oops.. something wrong")
    }
}
