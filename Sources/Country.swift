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
/// You can also get the list of countries as in the following code:
///
///     let countries = WPCountry.allEuropeanCountries
///         .sortedByPopulation
///         .top(10)
///         .shuffled()
///
public struct WPCountry {
    
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
        if let languageCode = NSLocale.current.languageCode {
            let locale = NSLocale(localeIdentifier: languageCode)
            let countryCode = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: isoCode])
            if let countyName = locale.displayName(forKey: NSLocale.Key.identifier, value: countryCode) {
                return countyName
            }
        }
        
        return nil
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
        guard NSLocale.isoCountryCodes.contains(isoCode) else { return nil }
        return nil
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
