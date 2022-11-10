//
//  HourlyView.swift
//  WeatherApp
//
//  Created by Axxiome Health on 08/11/2022.
//

import SwiftUI

struct HourlyView: View {
    var body: some View {
            VStack(spacing: 20) {
                ScrollView(.horizontal, showsIndicators: false) {
                    ZStack {
                        Color.black.opacity(0.2)
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
                    }
                }.frame( minHeight: 0, maxHeight: 125)
                    .cornerRadius(25)
            }.padding(20)
        }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView()
    }
}
