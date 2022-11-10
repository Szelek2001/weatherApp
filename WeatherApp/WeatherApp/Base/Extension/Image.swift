import Foundation
import SwiftUI

enum Symbols {
    static let map  = Image(systemName: "map")
    static let circle  = Image(systemName: "circle")
    static let listBullet  = Image(systemName: "list.bullet")
    static let location  = Image(systemName: "location")
}

enum Icon {
    static let sun  = Image(systemName: "sun.max.fill").renderingMode(.original) // clear and 01d
    static let moon  = Image(systemName: "moon.stars.fill").renderingMode(.original) // clear and 01n
    static let rain  = Image(systemName: "cloud.rain.fill").renderingMode(.original) // drizzle
    static let heavyRain = Image(systemName: "cloud.heavyrain").renderingMode(.original) // Rain
    static let snow  = Image(systemName: "snow").renderingMode(.original) // Snow
    // static let sleet : some View = Image(systemName: "cloud.sleet.fill").renderingMode(.original)
    // static let wind : some View = Image(systemName: "wind").renderingMode(.original)
    static let fog  = Image(systemName: "cloud.fog.fill").renderingMode(.original) // Atmosphere
    static let cloudy  = Image(systemName: "cloud.fill").renderingMode(.original) // Clouds
    static let partyCloudyDay  = Image(systemName: "cloud.sun.fill").renderingMode(.original) // Clouds and 02d
    static let partyCloudyNight  = Image(systemName: "cloud.moon.fill").renderingMode(.original) // Clouds  and 02n
    static let rainAndThounder  = Image(systemName: "cloud.bolt.rain.fill").renderingMode(.original) // Thunderstorm
    static let sunset  = Image(systemName: "sunset.fill").renderingMode(.original)
    static let sunrise = Image(systemName: "sunrise.fill").renderingMode(.original)
}
