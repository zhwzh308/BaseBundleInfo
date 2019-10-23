//
//  BundleInfoPlistRetriever.swift
//  
//
//  Created by Wenzhong Zhang on 2019-10-23.
//

import Foundation

public protocol BundleInfoPlistRetriever {
    /// The `Bundle` used for `object`.
    var bundle: Bundle { get }
    /// Value of object casted from `Any?` type
    var castedStringValue: String? { get }
    /// You can name the variable and use it for description.
    var name: String { get }
    /// Value of key obtained by `Bundle.object(forInfoDictionaryKey key: String)`
    var object: Any? { get }
    /**
     An `Optional<String>` containing best-effort value retrieved from dictionary.
     
     By default, `castedStringValue` is returned.
     */
    var stringValue: String? { get }
    /**
     A non-Optional string value for key.
     
     By default the `stringValue` is unwrapped and returned.
     You should either:
     - define a string value in your `Info.plist`, or
     - implement a default value for each undefined key
     Failure to do so will result an assertion failure when accessed.
     */
    var safeStringValue: String { get }
}

public extension BundleInfoPlistRetriever where Self: RawRepresentable, Self.RawValue == String {
    var bundle: Bundle { .main }
    var castedStringValue: String? { object as? String }
    var name: String { rawValue }
    var object: Any? { bundle.object(forInfoDictionaryKey: rawValue) }
    var stringValue: String? { castedStringValue }
    var safeStringValue: String {
        if let v = stringValue {
            return v
        }
        assert(false, "You should always implement `safeStringValue` for everything you define")
        return ""
    }
}
