//
//  AllLocationCells.swift
//  OnceUponATime
//
//  Created by Spencer Belton on 1/10/22.
//

import SwiftUI

//MARK: - Regular Location Cell

struct LocationCell: View {
    let location: Location
    var body: some View {
        HStack {
            Spacer(minLength: 15)
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color(#colorLiteral(red: 0.4582606282, green: 0.4582606282, blue: 0.4582606282, alpha: 0.4873715753)), radius: 10)
                    .frame(width: 320, height: 270)
                VStack {
                    if let firstImage = location.images[0] {
                        firstImage
                            .resizable()
                    }
                    Spacer(minLength: 12)
                    
                    VStack(alignment: .leading) {
                        
                        Text(location.name)
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Spacer(minLength: 5)
                        
                        Text(location.address.shortAddress())
                            .font(.subheadline)
                            .fontWeight(.light)
                        
                        Spacer(minLength: 10)
                        
                        FiveStars(location: location)
                        
                        Spacer()
                        
                    }
                    .frame(height: 80)
                    
                    
                    Spacer()
                    
                    
                }
                
                .frame(width: 320, height: 270)
                .cornerRadius(10)
                
                
                
            }
            .frame(width: 320, height: 305)
        }
    }
}

//MARK: - Small Location Cell

struct SmallLocationCell: View {
    var location: Location
    var body: some View {
        HStack {
            if let firstImage = location.images[0] {
                firstImage
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(maxWidth: 80)
                    .cornerRadius(40)
            }
            VStack(alignment: .leading, spacing: 3) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(location.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(location.address.shortAddress())
                }
                HStack {
                    Spacer()
                    Text("3.3 mi")
                        .font(.body)
                        .fontWeight(.light)
                        .foregroundColor(Color.gray)
                        .multilineTextAlignment(.trailing)
                        .offset(x: -5)
                }
            }
            .offset(x: 11)
        }
    }
}







//MARK: - For Preview

struct AllLocationCells: View {
    var body: some View {
        List(LocationStore().locations) { location in
            SmallLocationCell(location: location)
        }
    }
}

struct AllLocationCells_Previews: PreviewProvider {
    static var previews: some View {
        AllLocationCells()
    }
}
