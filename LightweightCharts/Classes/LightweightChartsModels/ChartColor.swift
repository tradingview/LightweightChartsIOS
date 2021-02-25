import Foundation
import UIKit

public enum ChartColor {
    case color(UIColor)
    case string(String)
}

// MARK: - ExpressibleByStringLiteral
extension ChartColor: ExpressibleByStringLiteral {

    public init(stringLiteral value: String) {
        self = .string(value)
    }

}

// MARK: - _ExpressibleByColorLiteral
extension ChartColor: _ExpressibleByColorLiteral {

    public init(_colorLiteralRed red: Float, green: Float, blue: Float, alpha: Float) {
        let color = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: CGFloat(alpha)
        )
        self = .color(color)
    }

}

// MARK: - Decodable
extension ChartColor: Decodable {

    public init(from decoder: Decoder) throws {
        let stringValue = try decoder.singleValueContainer().decode(String.self)
        self = .string(stringValue)
    }

}

// MARK: - Encodable
extension ChartColor: Encodable {

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }

}

// MARK: - CustomStringConvertible
extension ChartColor: CustomStringConvertible {

    public var description: String {
        switch self {
        case .color(let color):
            return stringRepresentationOfColor(color)
        case .string(let stringValue):
            return stringValue
        }
    }

    private func stringRepresentationOfColor(_ color: UIColor) -> String {
        var red: Int = 0
        var green: Int = 0
        var blue: Int = 0
        var alpha: CGFloat = 0

        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return "rgba(\(red), \(green), \(blue), \(alpha))"
    }

}
