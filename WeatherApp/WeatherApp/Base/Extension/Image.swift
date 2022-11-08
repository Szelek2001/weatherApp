import Foundation
import SwiftUI

enum Symbols {
    static let map = Image(systemName: "map")
    static let circle = Image(systemName: "circle")
    static let listBullet = Image(systemName: "list.bullet")
    static let location = Image(systemName: "location")
}

enum Icon {
    static let sun : some View = Image(systemName: "sun.max.fill").renderingMode(.original)
    static let moon : some View = Image(systemName: "moon.stars.fill").renderingMode(.original)
    static let rain : some View = Image(systemName: "cloud.rain.fill").renderingMode(.original)
    static let snow : some View = Image(systemName: "snow").renderingMode(.original)
    static let sleet : some View = Image(systemName: "cloud.sleet.fill").renderingMode(.original)
    static let wind : some View = Image(systemName: "wind").renderingMode(.original)
    static let fog : some View = Image(systemName: "cloud.fog.fill").renderingMode(.original)
    static let cloudy : some View = Image(systemName: "cloud.fill").renderingMode(.original)
    static let partyCloudyDay : some View = Image(systemName: "cloud.sun.fill").renderingMode(.original)
    static let partyCloudyNight : some View = Image(systemName: "cloud.moon.fill").renderingMode(.original)
    static let rainAndThounder : some View = Image(systemName: "cloud.bolt.rain.fill").renderingMode(.original)
    static let sunset : some View = Image(systemName: "sunset.fill").renderingMode(.original)
    static let sunrise: some View = Image(systemName: "sunrise.fill").renderingMode(.original)
}
