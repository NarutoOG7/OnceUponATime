//
//  LargeCardImage.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/15/22.
//

import SwiftUI

extension Image {
    func largeCardStyle() -> some View {
        self
            .resizable()
            .aspectRatio(1.25, contentMode: .fit)
            .cornerRadius(13)
            .frame(width: UIScreen.main.bounds.width)
    }
    
    func mediumCardStyle() -> some View {
        self
            .resizable()
            .aspectRatio(1.25, contentMode: .fit)
            .cornerRadius(13)
            .frame(width: 330)
    }
}
