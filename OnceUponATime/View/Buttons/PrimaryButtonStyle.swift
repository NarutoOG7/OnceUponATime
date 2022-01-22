//
//  PrimaryButtonStyle.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/15/22.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 50)
            .padding()
            .background(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
