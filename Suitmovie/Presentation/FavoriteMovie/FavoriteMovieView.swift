//
//  FavoriteMovieView.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 25/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI

struct FavoriteMovieView: View {
    
    @Binding var isShow: Bool
    @ObservedObject var favoriteMovieViewModel = FavoriteMovieViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack{
                if favoriteMovieViewModel.isLoading {
                    IndicatorView()
                } else if favoriteMovieViewModel.error != nil {
                    MessageView(message: favoriteMovieViewModel.error ?? ConstantsWording.sorryErrorOurSystem)
                } else {
                    List(favoriteMovieViewModel.movies, id: \.id) { movie in
                            ItemMovieView(movie: movie)
                    }
                }
            }
            .onAppear(perform: {
                self.favoriteMovieViewModel.fetchFavoriteMovie()
            })
            .navigationBarTitle(Text(ConstantsWording.favoriteMovie), displayMode: .inline)
            .navigationBarItems(leading:
                Button(action: {
                    self.isShow.toggle()
                }, label: {
                    Image(systemName: "chevron.left").foregroundColor(Color.white).frame(width: 50, height: 50)
                }))
        }
    }
}

struct FavoriteMovieView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteMovieView(isShow: .constant(true))
    }
}
