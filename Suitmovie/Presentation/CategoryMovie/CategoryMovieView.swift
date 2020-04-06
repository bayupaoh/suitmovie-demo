//
//  CategoryMovieView.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 25/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI

struct CategoryMovieView: View {
    @Binding var isPresent: Bool
    @Binding var category: Category
    @Binding var page: Int
    @Binding var isReloadData: Bool
    @ObservedObject var listMovieViewModel = ListMovieViewViewModel()
    let categories = ConstantsLists.categories
    
    var body: some View {
        NavigationView {
            List((0..<categories.count)) { row in
                Text("\(self.category == self.categories[row].category ? "✔": "") \(self.categories[row].name)").onTapGesture {
                    self.category = self.categories[row].category
                    self.page = 1
                    self.isReloadData = true
                    self.isPresent = false
                }
            }
            .navigationBarTitle(Text(ConstantsWording.category), displayMode: .inline)
        }
    }
}

struct CategoryMovieView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryMovieView(isPresent: .constant(true), category: .constant(.nowPlaying), page: .constant(1), isReloadData: .constant(false))
    }
}
