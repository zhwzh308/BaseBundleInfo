import XCTest
@testable import BaseBundleInfo

final class BaseBundleInfoTests: XCTestCase {
    private var testIdValue: BaseBundleInfo {
        .id
    }
    private var testNameValue: BaseBundleInfo {
        .name
    }
    private var testVersionValue: BaseBundleInfo {
        .version
    }
    func testBundleId() {
        let value = testIdValue
        check(value)
    }
    func testBundleName() {
        let value = testNameValue
        check(value, with: kCFBundleNameKey as String)
    }
    func testBundleVersion() {
        let value = testVersionValue
        check(value, with: kCFBundleVersionKey as String)
    }
    private func check(_ value: BaseBundleInfo) {
        XCTAssertNotNil(value.stringValue, "Missing \(value.name)")
        print(value.description)
    }
    private func check(_ value: BaseBundleInfo, with key: String) {
        XCTAssertEqual(key, value.rawValue, "\(value.name) Key Differs")
        check(value)
    }
    static var allTests = [
        ("testBundleId", testBundleId),
        ("testBundleName", testBundleName),
        ("testBundleVersion", testBundleVersion)
    ]
}
