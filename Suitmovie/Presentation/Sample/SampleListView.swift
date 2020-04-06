//
//  SampleListView.swift
//  Suitmovie
//
//  Created by Bayu Paoh on 06/04/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI

struct SampleListView: View {
    @State var isShowLoading = false
    
    init() {
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = .blue
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationView {
            VStack {
                if isShowLoading {
                    IndicatorView()
                } else {
                    List(Movie.fakes) { movie in
                        NavigationLink(destination: DetailMovieView(movie: movie)){
                            SampleCell(item: movie)
                        }
                    }
                    Button(action: {
                        
                    }){
                        Text("Category")
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                            .foregroundColor(Color.white) .background(Color.blue)
                    }
                }
            } .navigationBarTitle(Text("Suitmovie"), displayMode: .inline)
                .navigationBarItems(trailing: Button(action : {
                    self.isShowLoading.toggle()
                }){
                    Image(systemName: "heart.fill").foregroundColor(Color.red)
                })
        }
    }
}

struct SampleListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SampleListView().environment(\.colorScheme, .dark)
            SampleListView().environment(\.colorScheme, .light)
            SampleListView().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
        }
    }
}
