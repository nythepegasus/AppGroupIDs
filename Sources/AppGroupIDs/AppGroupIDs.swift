@_exported import Foundation


/// Protocol you can conform to that allows you to access your App Groups in a type safe way
@available(iOS 12.0, watchOS 8.0, tvOS 12.0, macOS 10.15, visionOS 1.0, *)
public protocol AppGroupID: RawRepresentable where StringLiteralType == String, RawValue == String {
    
    /// The id of your App Group without "group."
    var id: String { get }
}

@available(iOS 12.0, watchOS 8.0, tvOS 12.0, macOS 10.15, visionOS 1.0, *)
public extension AppGroupID {
    /// Returns either the App Group's ``URL`` or nil
    var container: URL? { FileManager.appGroupURL(self) }
    
    /// Returns either the related App Group's ``URL`` or the current app's ``FileManager.SearchPathDirectory.libraryDirectory``
    var _container: URL { FileManager.appGroupURL(self) ?? FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first! }
}

@available(iOS 12.0, watchOS 8.0, tvOS 12.0, macOS 10.15, visionOS 1.0, *)
public extension AppGroupID where Self: RawRepresentable, Self.RawValue == String {
    /// Returns the ``rawValue`` of a case from an enum that inherits ``AppGroupID``
    var id: String { rawValue }
}

@available(iOS 12.0, watchOS 8.0, tvOS 12.0, macOS 10.15, visionOS 1.0, *)
extension FileManager {
    /// Returns either the App Group's ``URL`` or nil
    static func appGroupURL(_ group: some AppGroupID) -> URL? { self.default.containerURL(forSecurityApplicationGroupIdentifier: "group." + group.id) }
}

