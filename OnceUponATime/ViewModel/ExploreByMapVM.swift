//
//  ExploreByMapVM.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/15/22.
//

import Foundation

class ExploreByMapVM: ObservableObject {
    static let instance = ExploreByMapVM()
    var selectedLocationDistance: Double = 0
    var locationDetailsCanScroll: Bool {
        get {
            if SlideUpCardVM.instance.position == .top {
                return true
            } else {
                return false
            }
        } set {
            return
        }
    }

}

//MARK: - SelectedEBMFilter

class SelectedExploreByMapFilter: ObservableObject {
    
    enum Filters {
        case onMap
        case nearby
    }
    
    static let instance = SelectedExploreByMapFilter()
    @Published var option: Filters = Filters.onMap
    
    func switchOption() {
        if option == Filters.onMap {
            option = .nearby
        } else {
            option = .onMap
        }
    }
}

