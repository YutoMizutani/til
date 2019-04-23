## Select Package versions

```swift
extension Package.Dependency {

    public static func package(url: String, from version: PackageDescription.Version) -> PackageDescription.Package.Dependency

    public static func package(url: String, _ requirement: PackageDescription.Package.Dependency.Requirement) -> PackageDescription.Package.Dependency

    public static func package(url: String, _ range: Range<PackageDescription.Version>) -> PackageDescription.Package.Dependency

    public static func package(url: String, _ range: ClosedRange<PackageDescription.Version>) -> PackageDescription.Package.Dependency

    /// Add a dependency to a local package on the filesystem.
    public static func package(path: String) -> PackageDescription.Package.Dependency
}

extension Package.Dependency.Requirement : Encodable {

    /// The requirement is specified by an exact version.
    public static func exact(_ version: PackageDescription.Version) -> PackageDescription.Package.Dependency.Requirement

    /// The requirement is specified by a source control revision.
    public static func revision(_ ref: String) -> PackageDescription.Package.Dependency.Requirement

    /// The requirement is specified by a source control branch.
    public static func branch(_ name: String) -> PackageDescription.Package.Dependency.Requirement

    /// Creates a specified for a range starting at the given lower bound
    /// and going upto next major version.
    public static func upToNextMajor(from version: PackageDescription.Version) -> PackageDescription.Package.Dependency.Requirement

    /// Creates a specified for a range starting at the given lower bound
    /// and going upto next minor version.
    public static func upToNextMinor(from version: PackageDescription.Version) -> PackageDescription.Package.Dependency.Requirement

    /// Encodes this value into the given encoder.
    ///
    /// If the value fails to encode anything, `encoder` will encode an empty
    /// keyed container in its place.
    ///
    /// This function throws an error if any values are invalid for the given
    /// encoder's format.
    ///
    /// - Parameter encoder: The encoder to write data to.
    public func encode(to encoder: Encoder) throws
}
```

[apple/swift-package-manager](https://github.com/apple/swift-package-manager)
[swift-package-manager/Sources/PackageDescription4/PackageDependency.swift](https://github.com/apple/swift-package-manager/blob/8cdced9f931e9cd1e613251af77bb73aa54eac1f/Sources/PackageDescription4/PackageDependency.swift)
