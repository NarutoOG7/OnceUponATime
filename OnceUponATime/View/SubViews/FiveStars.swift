//
//  FiveStars.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/12/22.
//

import SwiftUI

struct FiveStars: View {
    var location: Location
    var body: some View {
        HStack {
            StarIcon(filled: location.avgRating > 0)
            StarIcon(filled: location.avgRating > 1)
            StarIcon(filled: location.avgRating > 2)
            StarIcon(filled: location.avgRating > 3)
            StarIcon(filled: location.avgRating > 4)
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

