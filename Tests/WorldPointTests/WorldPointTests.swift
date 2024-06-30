import XCTest
@testable import WorldPoint

final class WorldPointTests: XCTestCase {
    
    private var isoCountryCodes: [String] {
        return NSLocale.isoCountryCodes.filter { $0 != "AQ" && $0 != "CQ" } // Without Antarctica and "the island of Sark"
    }
    
    func testCountryCreation() -> Void {
        XCTAssertEqual(WPCountry(isoCode: "RU"), .Russia)
        XCTAssertEqual(WPCountry(isoCode: "cn"), .China)
        XCTAssertEqual(WPCountry(isoCode: "US"), .UnitedStates)
        XCTAssertEqual(WPCountry(isoCode: "br"), .Brazil)
        XCTAssertEqual(WPCountry(isoCode: "Eg"), .Egypt)
        XCTAssertEqual(WPCountry(isoCode: "AU"), .Australia)
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
    
    func testCountryCodable() -> Void {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        let country1: WPCountry = .Russia
        let country2: WPCountry = .China
        let country3: WPCountry = .UnitedStates
        let country4: WPCountry = .Brazil
        let country5: WPCountry = .Egypt
        let country6: WPCountry = .Australia
        
        func encodeDecode(_ country: WPCountry) throws -> WPCountry {
            let encoded = try encoder.encode(country)
            let decoded = try decoder.decode(WPCountry.self, from: encoded)
            return decoded
        }
        XCTAssertEqual(try encodeDecode(country1), country1)
        XCTAssertEqual(try encodeDecode(country2), country2)
        XCTAssertEqual(try encodeDecode(country3), country3)
        XCTAssertEqual(try encodeDecode(country4), country4)
        XCTAssertEqual(try encodeDecode(country5), country5)
        XCTAssertEqual(try encodeDecode(country6), country6)
    }
    
    func testCountryHashable() -> Void {
        let array = WPCountry.allCountries
        let set = Set(array)
        XCTAssertEqual(array.count, set.count)
    }
    
}

