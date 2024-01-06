import XCTest
@testable import WorldPoint

final class WorldPointTests: XCTestCase {
    
    private var isoCountryCodes: [String] {
        return NSLocale.isoCountryCodes.filter { $0 != "AQ" } // Without Antarctica
    }
    
    func testISOCountryCodesPresence() -> Void {
        let sourceCodes = isoCountryCodes.sorted { $0 < $1 }
        let addedCodes = WPCountry.allCountries.map { $0.isoCode }.sorted { $0 < $1 }
        for (addedCode, sourceCode) in zip(addedCodes, sourceCodes) {
            XCTAssertEqual(addedCode, sourceCode)
        }
    }
    
    func testCountriesCount() -> Void {
        let sourceCodes = isoCountryCodes
        let addedCodes = WPCountry.allCountries.map { $0.isoCode }
        XCTAssertEqual(addedCodes.count, sourceCodes.count)
    }
    
}

