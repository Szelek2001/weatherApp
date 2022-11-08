//
//  DailyView.swift
//  WeatherApp
//
//  Created by Axxiome Health on 08/11/2022.
//

import SwiftUI

struct DailyView: View {
    var body: some View {
        ZStack {
                    HStack(alignment: .center) {
                        Text("Poniedziałek")
                        Spacer()
                        HStack(spacing: 16) {
                            Text("20")
                                .foregroundColor(.gray)
                            Text("23")
                        }
                    }
                    .padding(10)
                    HStack(alignment: .center) {
                        Spacer()
                        Icon.sun
                            .font(.body)
                        Spacer()
                    }
        }.frame( minHeight: 0, maxHeight: 30)
            .padding([.leading, .trailing])
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
