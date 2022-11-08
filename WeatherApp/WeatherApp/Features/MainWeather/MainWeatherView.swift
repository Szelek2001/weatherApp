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
                colors: [.black, .blue],
                startPoint: .top,
                endPoint: .bottom)
                .opacity(0.5)
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    Text("Wrocław")
                        .font(.system(size: 36, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                    Text("10°C")
                        .font(.system(size: 50, weight: .medium, design: .monospaced))
                        .foregroundColor(.white)
                    Text("Od 5°C Do 22°C")
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                        .foregroundColor(.white)
                    Icon.partyCloudyDay.font(.system(size: 100))
                    //                    ZStack {
                    //                        Color.gray.opacity(0.3)
                    //                        VStack {
                    //                            Icon.clearDay
                    //                            Icon.clearNight
                    //                            Icon.rain
                    //                            Icon.snow
                    //                            Icon.sleet
                    //                            Icon.wind
                    //                            Icon.fog
                    //                            Icon.cloudy
                    //                            Icon.partyCloudyDay
                    //                            Icon.partyCloudyNight
                    //                        }
                    //                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        ZStack {
                            Color.black.opacity(0.1)
                            HStack(spacing: 16) {
                                ForEach(0..<25, id: \.self) { hour in
                                    VStack(spacing: 16) {
                                        Text("\(hour)").foregroundColor(.white)
                                        Icon.sun.font(.system(size: 20))
                                        Text("20°C").foregroundColor(.white)
                                    }.padding(5)
                                }
                            }
                            .padding([.trailing, .leading])
                        }
                    }.frame( minHeight: 0, maxHeight: 125)
                        .cornerRadius(25)
                        .padding([.top, .bottom])
                }.padding(10)
            }
        }
    }
}

struct MainWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MainWeatherView()
    }
}
