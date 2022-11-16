//
//  HourlyView.swift
//  WeatherApp
//
//  Created by Axxiome Health on 08/11/2022.
//

import SwiftUI

struct HourlyView: View {
    var body: some View {
        VStack {
            HStack {
                Symbols.clock
                Text("Godzinowa prognoza")
            }.frame(maxWidth: .infinity,alignment: .leading).padding([.top,.leading, .trailing], 10)
                .modifier(DescriptionModifiers(isShadow: true))
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<25, id: \.self) { hour in
                        VStack(spacing: 16) {
                            Text("\(hour)")
                                .modifier(DescriptionModifiers())
                            Icon.sun.modifier(DescriptionModifiers())
                            Text("20°C").modifier(DescriptionModifiers())
                        }
                    }.padding(5)
                }
                .padding([.trailing, .leading])
            }.frame(height: 100)
        }   .background(.ultraThinMaterial)
            .cornerRadius(25)
            .padding([.leading, .trailing], 20).colorScheme(.dark)
    }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView()
    }
}
