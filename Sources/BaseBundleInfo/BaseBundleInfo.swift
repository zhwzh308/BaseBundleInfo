import Foundation

public enum BaseBundleInfo: String, BundleInfoPlistRetriever, CustomStringConvertible {
    /// The `kCFBundleIdentifierKey`
    case id = "CFBundleIdentifier"
    /// The `kCFBundleNameKey`
    case name = "CFBundleName"
    /// The `kCFBundleVersionKey`
    case version = "CFBundleVersion"
    public var description: String {
        sentence
    }
    /// The string value for the key. When configuring the `Info.plist` file.
    /// You must set the value type to `String`, other types will result a `nil` as result
    public var stringValue: String? {
        switch self {
        case .id:
            return bundle.bundleIdentifier
        default:
            return castedStringValue
        }
    }
    /// Convenience method for generating human readable output. Not exposed.
    private var sentence: String {
        ["The", name, "is", safeStringValue].joined(separator: " ")
    }
}
