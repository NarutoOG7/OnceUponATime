//
//  IconImage.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/9/22.
//

import SwiftUI

struct IconImage: View {
    var image: Image
    var color: Color
    var body: some View {
        image
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .foregroundColor(color)
            .frame(maxWidth: 23)
    }
}
