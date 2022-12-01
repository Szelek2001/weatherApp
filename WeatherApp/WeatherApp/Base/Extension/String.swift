import Foundation

extension String {
    static func placeholder(length: Int) -> String {
        String(Array(repeating: "X", count: length))
    }
    static func convertUNIXToFormat(unix: Int, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date(timeIntervalSince1970: Double(unix)))
    }
}
