//
//  BinPacking.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/21/22.
//

import SwiftUI

struct BinPacking: View {
    var area: CGFloat
    var width: CGFloat
    var height: CGFloat
    
    var images: [Image]
    
    init(images: [Image]) {
        area = UIScreen.main.bounds.width * 800
        width = UIScreen.main.bounds.width
        height = UIScreen.main.bounds.height
        self.images = images
    }
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width, height: height)
            
        }
    }
}

struct BinPacking_Previews: PreviewProvider {
    static var previews: some View {
        BinPacking(images: Location.example.images)
    }
}
