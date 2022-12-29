import Foundation

@propertyWrapper
struct UserDefault<Value> {
    let key: String
    let defaultValue: Value
    var container: UserDefaults = .standard
    var wrappedValue: Value {
        get {
            return container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
        }
    }
}

extension UserDefaults {
    @UserDefault(key: "location", defaultValue: (50.9077147, 14.9539185))
    static var location: (Double?, Double?)
    @UserDefault (key: "latitude", defaultValue: 50.9077147)
    static var latitude: Double?
    @UserDefault (key: "longitude", defaultValue: 14.9539185)
    static var longitude: Double?
}
