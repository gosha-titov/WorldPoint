/// A continent that is any of several large geographical regions.
///
/// The list of continents: `Asia`, `Africa`, `Europe`, `NorthAmerica`, `SouthAmerica`, `Australia` and `Antartica`.
public enum WPContinent: String, CaseIterable {
    case Asia
    case Africa
    case Europe
    case NorthAmerica
    case SouthAmerica
    case Australia
    case Antartica
}


extension WPContinent {
    
    /// An array of all countries located on this continent.
    public var allCountries: [WPCountry] {
        return switch self {
        case .Asia: WPCountry.allAsianCountries
        case .Africa: WPCountry.allAfricanCountries
        case .Europe: WPCountry.allEuropeanCountries
        case .NorthAmerica: WPCountry.allNorthAmericanCountries
        case .SouthAmerica: WPCountry.allSouthAmericanCountries
        case .Australia: WPCountry.allAustralianCountries
        case .Antartica: []
        }
    }
    
}
