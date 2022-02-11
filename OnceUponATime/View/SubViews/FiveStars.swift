//
//  FiveStars.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/12/22.
//

import SwiftUI

struct FiveStars: View {
    var location: Location
    
    @State var avgRating = 0
    var body: some View {
        if let rating = location.review {
            if rating.avgRating == "" {
                self.avgRating = 0
            } else {
                self.avgRating = Int(rating.avgRating)!
            }
        }
        return HStack(alignment: .top) {
            StarIcon(filled: avgRating > 0)
            StarIcon(filled: avgRating > 1)
            StarIcon(filled: avgRating > 2)
            StarIcon(filled: avgRating > 3)
            StarIcon(filled: avgRating > 4)
        }
    }
}

struct StarIcon: View {
    var filled: Bool = true
    var body: some View {
        Image(systemName: filled ? "star.fill" : "star")
            .foregroundColor(filled ? Color.yellow : Color.black.opacity(0.6))
    }
}

