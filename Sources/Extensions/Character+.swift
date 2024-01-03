import Foundation

extension Character {
    
    /// Returns the flag emoji for a specific ISO country code.
    internal static func flagEmoji(forRegion countryCode: String) -> Character? {
        guard NSLocale.isoCountryCodes.contains(countryCode) else { return nil }
        let countryCode = countryCode.uppercased()
        let offset: UInt32 = 127397
        var flagString = String()
        for scalar in countryCode.unicodeScalars {
            if let scalar = UnicodeScalar(scalar.value + offset) {
                flagString.unicodeScalars.append(scalar)
            }
        }
        return flagString.first
    }
    
}
