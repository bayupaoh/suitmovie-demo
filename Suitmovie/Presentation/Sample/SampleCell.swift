//
//  SampleCell.swift
//  Suitmovie
//
//  Created by Bayu Paoh on 06/04/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI

struct SampleCell: View {
    var item: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 90.0, height: 90.0, alignment: .center)
                .background(Color.gray)
            VStack {
                Text(item.title)
                    .font(.system(size: 20))
                    .bold().lineLimit(2)
                    .foregroundColor(Color.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Text(item.releaseDate ?? "")
                    .font(.system(size: 15))
                    .foregroundColor(Color.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                Text(item.overview ?? "")
                    .font(.system(size: 15))
                    .lineLimit(2)
                    .foregroundColor(Color.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        .padding(4)
    }
}

struct SampleCell_Previews: PreviewProvider {
    static var previews: some View {
        SampleCell(item: Movie.fake)
    }
}
