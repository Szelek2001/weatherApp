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
                        Color.black.opacity(0.1)
                        HStack(spacing: 16) {
                            ForEach(0..<25, id: \.self) { hour in
                                VStack(spacing: 16) {
                                    Text("\(hour)").foregroundColor(.white)
                                    Icon.sun.font(.system(size: 20))
                                    Text("20°C").foregroundColor(.white)
                                }
                            }.padding(5)
                        }
                        .padding([.trailing, .leading])
                    }
                }.frame( minHeight: 0, maxHeight: 125)
                    .cornerRadius(25)
                    .padding([.top, .bottom])
            }.padding(10)
        }
}

struct HourlyView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyView()
    }
}
