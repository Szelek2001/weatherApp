//
//  MainWeatherView.swift
//  WeatherApp
//
//  Created by Axxiome Health on 08/11/2022.
//

import SwiftUI

struct MainWeatherView: View {
    var body: some View {
            ZStack {
                LinearGradient(
                    colors: [.blue, .white],
                    startPoint: .top,
                    endPoint: .bottom)
                .opacity(0.3)
                .ignoresSafeArea()
                ScrollView {
                    VStack {
                        Text("Wrocław")
                            .font(.system(size: 36, weight: .semibold, design: .monospaced))
                            .foregroundColor(.white)
                        Text("10°C")
                            .font(.system(size: 50, weight: .medium, design: .monospaced))
                            .foregroundColor(.white)
                        Text("Od 5°C Do 22°C")
                            .font(.system(size: 15, weight: .semibold, design: .monospaced))
                            .foregroundColor(.white)
                        Icon.sun.font(.system(size: 100))
                        HourlyView()
                        ZStack {
                            Color.black.opacity(0.1)
                            VStack {
                                ForEach(1...7, id: \.self) {_ in
                                    DailyView()
                                    Divider()
                                }
                            }.padding(10)
                        }.cornerRadius(25).padding(10)
                    }
                }.padding(.top, 1)
            }
    }

}

struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}
