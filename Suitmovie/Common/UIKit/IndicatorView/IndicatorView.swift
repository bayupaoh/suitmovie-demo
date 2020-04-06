//
//  IndicatorView.swift
//  Kitamovie
//
//  Created by Bayu Paoh on 26/02/20.
//  Copyright © 2020 Bayu Paoh. All rights reserved.
//

import SwiftUI
import UIKit

struct IndicatorView: UIViewRepresentable {

    typealias UIViewType = UIActivityIndicatorView
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.hidesWhenStopped = true
        uiView.startAnimating()
    }
}

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView()
    }
}
