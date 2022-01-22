//
//  IconImage.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/9/22.
//

import SwiftUI

struct IconImage: View {
    var image: Image
    var iconColor: Color
    var tileBackground: Bool
    var tileColor: Color?
    var width: CGFloat
    var height: CGFloat
    var body: some View {
        ZStack {
        RoundedRectangle(cornerRadius: 10)
            .fill(tileBackground ? (tileColor ?? Color.white) : Color.clear)
            .frame(width: width, height: height)
            .shadow(color: Color(#colorLiteral(red: 0.4582606282, green: 0.4582606282, blue: 0.4582606282, alpha: 0.4873715753)), radius: 7)
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(iconColor)
                .frame(width: width / 1.5, height: height / 1.5)
        }
    }
}
