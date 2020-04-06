//
//  ContentView.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 24/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI

struct ListMovieView: View {
    @State var page = 1
    @State var isShowFavorit = false
    @State var isShowFilter = false
    @State var isReloadData = false
    @State var category: Category = .popular
    @ObservedObject private var listMovieViewModel = ListMovieViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if listMovieViewModel.isLoading {
                    IndicatorView()
                } else if listMovieViewModel.error != nil {
                    MessageView(message: listMovieViewModel.error ?? ConstantsWording.sorryErrorOurSystem)
                } else {
                    
                    List(listMovieViewModel.movies, id: \.id) { movie in
                                ItemMovieView(movie: movie)
                                    .onAppear {
                                        let lastItem = self.listMovieViewModel.movies.last!
                                        if lastItem.id == movie.id {
                                            self.page += 1
                                            self.listMovieViewModel.fetchMovie(category: self.category, page: self.page)
                                            
                                        }
                                }
                    }
                }
                Button(action: {
                    self.isShowFilter.toggle()
                }){
                    Text(ConstantsWording.category)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 60)
                        .foregroundColor(Color.white).background(Color.blue)
                }.sheet(isPresented: $isShowFilter, onDismiss: {
                    if self.isReloadData {
                        self.listMovieViewModel.fetchMovie(category: self.category, page: self.page)
                        self.isReloadData = false
                    }
                }) {
                    CategoryMovieView(isPresent: self.$isShowFilter, category: self.$category, page: self.$page, isReloadData: self.$isReloadData)
                }
            }.onAppear(perform: {
                self.listMovieViewModel.fetchMovie(category: self.category, page: self.page)
            })
            .navigationBarTitle(Text(ConstantsWording.kitaMovie), displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.isShowFavorit.toggle()
                }, label: {
                    Image(systemName: "heart.fill").foregroundColor(Color.red).frame(width: 50, height: 50)
                }).sheet(isPresented: $isShowFavorit) {
                    FavoriteMovieView(isShow: self.$isShowFavorit)
                }
            ).edgesIgnoringSafeArea(.bottom)
            
        }
    }
}

struct ListMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ListMovieView()
    }
}
