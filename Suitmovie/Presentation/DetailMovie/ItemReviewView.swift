//
//  ItemReviewView.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 27/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI

struct ItemReviewView: View {
    var review: Review
    
    var body: some View {
        VStack(spacing: 8.0) {
            Text(review.author ?? "").font(.system(size: 15))
                .bold().lineLimit(2)
                .foregroundColor(Color.gray)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Text(review.content ?? "")
                .font(.body)
                .italic()
                .lineLimit(2)
                .foregroundColor(Color.gray)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(4.0)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

struct ItemReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ItemReviewView(review: Review(id: "0001", author: "Bayu Paoh", content: "Nice", url: "https://www.themoviedb.org/review/578193f29251417c28001764"))
    }
}
