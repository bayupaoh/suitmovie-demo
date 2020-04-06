//
//  ItemMovieView.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 25/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct ItemMovieView: View {
    var movie: Movie
    
    var body: some View {
        ZStack{
            NavigationLink(destination: DetailMovieView(movie: movie)) {
                
                HStack(alignment: .top, spacing: 8.0) {
                    KFImage(movie.posterURL)
                        .resizable()
                        .frame(width: 100.0, height: 100.0, alignment: .center)
                        .background(Color.gray)
                    
                    VStack(spacing: 8.0) {
                        Text(movie.title).font(.system(size: 20))
                            .bold().lineLimit(2)
                            .foregroundColor(Color.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text(movie.releaseDate ?? "")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                        Text(movie.overview ?? "")
                            .font(.body)
                            .lineLimit(2)
                            .foregroundColor(Color.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        
                    }
                    Spacer()
                }
            }
        }
        .padding(8.0)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
        
    }
}

struct ItemMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ItemMovieView(movie: Movie(id: 0, title: "Test Movie", backdropPath: "", posterPath: "", overview: "", releaseDate: "", adult: false))
    }
}
