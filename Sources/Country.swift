import Foundation

/// A country with the corresponding general information.
///
/// In order to create a certain country, you should specify its ISO country code:
///
///     let country = WPCountry(isoCode: "TR")!
///     country.systemName // "Turkey"
///     country.localizedName // "Türkiye"
///     country.flagEmoji // "🇹🇷"
///     country.continent // .Asia
///     country.population // 86_023_777
///     country.area // 783_562
///
/// Or you can manually choose the country from the existing ones:
///
///     let country: WPCountry = .Turkey
///     country.isoCode // "TR"
///
/// You can also work with the list of countries as in the following code:
///
///     // Top 10 European countries by population
///     let countries = WPCountry.allEuropeanCountries
///         .sortedByPopulation
///         .top(10)
///
public struct WPCountry {
    
    /// Returns available countries of all continents.
    ///
    /// Countries are sorted by continent, not by name.
    /// In order to sort countries by name, use the `sortedByName` property:
    ///
    ///     let countries = WPCountry.allCountries.sortedByName
    ///
    public static var allCountries: [WPCountry] {
        return allEuropeanCountries +
               allAsianCountries +
               allNorthAmericanCountries +
               allSouthAmericanCountries +
               allAfricanCountries +
               allAustralianCountries
    }
    
    /// The ISO country code consisting of a two-letter combination.
    ///
    ///     WPCountry.Russia.isoCode // "RU"
    ///     WPCountry.China.isoCode // "CN"
    ///     WPCountry.UnitedStates.isoCode // "US"
    ///
    public var isoCode: String
    
    /// The population of this country.
    ///
    ///     WPCountry.China.population // "1_439_323_776"
    ///     WPCountry.Russia.population // "146_452_123"
    ///     WPCountry.Turkey.population // "86_023_777"
    ///
    /// - Note: This number is approximate and may vary slightly depending on the source.
    public var population: Int
    
    /// The area (in square kilometers) of this country.
    ///
    ///     WPCountry.Russia.area // "17_098_246"
    ///     WPCountry.France.area // "551_695"
    ///     WPCountry.Monaco.area // "2"
    ///
    /// - Note: This number is approximate and may vary slightly depending on the source.
    public var area: Int
    
    /// The continent on which this country is located.
    ///
    ///     WPCountry.Russia.continent // .Europe
    ///     WPCountry.China.continent // .Asia
    ///     WPCountry.UnitedStates.continent // .NorthAmerica
    ///
    public var continent: WPContinent
    
    /// The system name of this country using for debugging.
    ///
    ///     WPCountry.Turkey.systemName // "Turkey"
    ///     WPCountry.Myanmar.systemName // "Myanmar"
    ///     WPCountry.TimorLeste.systemName // "TimorLeste"
    ///
    public var systemName: String
    
    /// A name of this country localized to the current device language if possible; otherwise, `nil`.
    ///
    ///     WPCountry.Turkey.localizedName // Optional("Türkiye")
    ///     WPCountry.Myanmar.localizedName // Optional("Myanmar [Burma]")
    ///     WPCountry.TimorLeste.localizedName // Optional("Timor-Leste")
    ///
    public var localizedName: String? {
        let languageCode = NSLocale.current.languageCode ?? ""
        return localizedName(forRegion: languageCode)
    }
    
    /// The flag emoji of this country.
    ///
    ///     WPCountry.Russia.flagEmoji // "🇷🇺"
    ///     WPCountry.China.flagEmoji // "🇨🇳"
    ///     WPCountry.UnitedStates.flagEmoji // "🇺🇸"
    ///
    public var flagEmoji: Character {
        return Character.flagEmoji(forRegion: isoCode) ?? Character("🏴")
    }
    
    
    // MARK: Methods
    
    /// Returns a localized name of this country for a certain region.
    ///
    ///     let country = WPCountry.Russia
    ///     country.localizedName(forRegion: "en") // Optional("Russia")
    ///     country.localizedName(forRegion: "ru") // Optional("Россия")
    ///     country.localizedName(forRegion: "fr") // Optional("Russie")
    ///
    public func localizedName(forRegion languageCode: String) -> String? {
        let locale = NSLocale(localeIdentifier: languageCode)
        let countryCode = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: isoCode])
        if let countyName = locale.displayName(forKey: NSLocale.Key.identifier, value: countryCode) {
            return countyName
        }
        return nil
    }
    
    
    // MARK: Init
    
    /// Creates a country with the given ISO code.
    ///
    ///     let country = WPCountry(isoCode: "TR")!
    ///     country.systemName // "Turkey"
    ///     country.localizedName // "Türkiye"
    ///     country.flagEmoji // "🇹🇷"
    ///     country.continent // .Asia
    ///     country.population // 86_023_777
    ///     country.area // 783_562
    ///
    public init?(isoCode: String) {
        let isoCode = isoCode.uppercased()
        guard NSLocale.isoCountryCodes.contains(isoCode) else { return nil }
        if let country = WPCountry.allEuropeanCountries.first(where: { $0.isoCode == isoCode }) {
            self = country
        } else if let country = WPCountry.allAsianCountries.first(where: { $0.isoCode == isoCode }) {
            self = country
        } else if let country = WPCountry.allNorthAmericanCountries.first(where: { $0.isoCode == isoCode }) {
            self = country
        } else if let country = WPCountry.allSouthAmericanCountries.first(where: { $0.isoCode == isoCode }) {
            self = country
        } else if let country = WPCountry.allAfricanCountries.first(where: { $0.isoCode == isoCode }) {
            self = country
        } else if let country = WPCountry.allAustralianCountries.first(where: { $0.isoCode == isoCode }) {
            self = country
        } else {
            return nil
        }
    }
    
    /// Creates a country with the given general information.
    internal init(systemName: String, isoCode: String, continent: WPContinent, population: Int, area: Int) {
        self.systemName = systemName
        self.isoCode = isoCode
        self.continent = continent
        self.population = population
        self.area = area
    }
    
}


extension WPCountry: Equatable {
    
    public static func == (lhs: WPCountry, rhs: WPCountry) -> Bool {
        return lhs.systemName == rhs.systemName &&
               lhs.isoCode == rhs.isoCode &&
               lhs.population == rhs.population &&
               lhs.area == rhs.area &&
               lhs.continent == rhs.continent
    }
    
}
