//
//  DetailMovieView.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 25/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct DetailMovieView: View {
    
    var movie: Movie
    @State var page = 1
    @ObservedObject var detailMovieViewModel = DetailMovieViewViewModel()
    
    var body: some View {
        VStack {
            if detailMovieViewModel.isShowAlert {
                HStack {
                    Text(detailMovieViewModel.messageAlert ?? "").foregroundColor(Color.white)
                        .padding()
                    Spacer()
                    Button(action: {
                        self.detailMovieViewModel.isShowAlert = false
                    }){
                        Image(systemName: "xmark").frame(width: 10.0, height: 10.0).padding().foregroundColor(Color.white)
                    }
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding(8.0)
            }
            HStack(alignment: .top, spacing: 8.0) {
                ZStack {
                    KFImage(movie.posterURL)
                        .resizable()
                        .frame(width: 100.0, height: 150.0, alignment: .center)
                        .background(Color.gray)
                }
                VStack(alignment: .leading, spacing: 8.0) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(movie.title)                            .font(.system(size: 20))
                                .bold()
                                .lineLimit(2)
                                .foregroundColor(Color.gray)
                            Text(movie.releaseDate ?? "")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                        Spacer()
                        Button(action: {
                            if self.detailMovieViewModel.isFavorite {
                                self.detailMovieViewModel.removeFavorite(movie: self.movie)
                            } else {
                                self.detailMovieViewModel.addFavorite(movie: self.movie)
                            }
                        }) {
                            Image(systemName: detailMovieViewModel.isFavorite ? "heart.fill": "heart")
                                .foregroundColor(Color.red)
                                .frame(width: 30, height: 30)
                        }
                    }
                    Text("Overview")
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(Color.gray)
                    
                    Text(movie.overview ?? "")
                        .font(.body)
                        .foregroundColor(Color.gray)
                }
            }
            .padding(8.0)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding(4)
            
            Text("Review Movie")
                .font(.system(size: 20))
                .bold()
            
            if detailMovieViewModel.isLoading {
                IndicatorView()
            } else if detailMovieViewModel.error != nil {
                MessageView(message: detailMovieViewModel.error ?? ConstantsWording.sorryErrorOurSystem)                        .frame(width: 100.0, height: 150.0, alignment: .center)
                
            } else {
                List(detailMovieViewModel.reviews, id: \.id) { item in
                    ItemReviewView(review: item)
                        .onAppear {
                            let lastItem = self.detailMovieViewModel.reviews.last!
                            if lastItem.id == item.id {
                                self.page += 1
                                self.detailMovieViewModel.fetchReview(idMovie: self.movie.id, page: self.page)
                            }
                    }
                }
            }
            Spacer()
        }.onAppear(perform: {
            self.detailMovieViewModel.fetchReview(idMovie: self.movie.id, page: self.page)
            self.detailMovieViewModel.checkFavorite(movie: self.movie)
        })
            .navigationBarTitle(Text(movie.title))
    }
    
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(movie: Movie.fake)
    }
}
