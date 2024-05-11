import XCTest
@testable import VcPackage

final class VcPackageTests: XCTestCase {
    func testExample() throws {
        HttpManage<String>().requset(url: "", para: [:]) { response in
            
        } failure: { error in
            
        }

    }
}
