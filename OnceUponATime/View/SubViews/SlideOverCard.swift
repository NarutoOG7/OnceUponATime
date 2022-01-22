//
//  SlideOverCard.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/10/22.
//

import SwiftUI


struct SlideOverCard<Content: View>: View {
    @GestureState private var dragState = DragState.inactive
    var isScrollable: Bool = false
    @ObservedObject var viewModel = SlideUpCardVM.instance
    var content: () -> Content
    var body: some View {
        
        let drag = DragGesture()
            .updating($dragState) { (drag, state, transaction) in
                state = .dragging(translation: drag.translation)
            }
            .onEnded(onDragEnded)
        return Group {
            Handle()
            self.content()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 400)
        .background(Color.white)
        .cornerRadius(25)
        .shadow(color: Color(.sRGBLinear, white: 0, opacity: 0.13), radius: 10.0)
        .offset(y: viewModel.position.rawValue + self.dragState.translation.height)
        .animation(self.dragState.isDragging ? nil : .interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
        .gesture(drag)
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        let verticalDirection = drag.predictedEndLocation.y - drag.location.y
        let cardTopEdgeLocation = viewModel.position.rawValue + drag.translation.height
        let positionAbove: CardPosition
        let positionBelow: CardPosition
        let closestPosition: CardPosition
        
        if cardTopEdgeLocation <= CardPosition.middle.rawValue {
            positionAbove = .top
            positionBelow = .middle
        } else {
            positionAbove = .middle
            positionBelow = .bottom
        }
        
        
        if (cardTopEdgeLocation - positionAbove.rawValue) < (positionBelow.rawValue - cardTopEdgeLocation) {
            closestPosition = positionAbove
        } else {
            closestPosition = positionBelow
        }
        
        
        if verticalDirection > 0 {
            viewModel.position = positionBelow
        } else if verticalDirection < 0 {
            viewModel.position = positionAbove
        } else {
            viewModel.position = closestPosition
        }
    }
    
    
}

struct Handle: View {
    private let handleThickness = CGFloat(5.0)
    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2)
            .frame(width: 40, height: handleThickness)
            .foregroundColor(Color.secondary)
            .padding(5)
    }
}


enum CardPosition: CGFloat {
    case top = 300
    case middle = 650
    case bottom = 900
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}


class SlideUpCardVM: ObservableObject {
    static let instance = SlideUpCardVM()
    @Published var position: CardPosition = .bottom
}
