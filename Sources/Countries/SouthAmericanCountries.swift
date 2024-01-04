extension WPCountry {
    
    /// Returns all countries located on the South America continent.
    public static var allSouthAmericanCountries: [WPCountry] {
        return [
            Argentina,
            Bolivia, Brazil,
            Chile, Colombia,
            Ecuador,
            Guyana,
            Paraguay, Peru,
            Suriname,
            Uruguay,
            Venezuela
        ]
    }
    
    
    public static var Argentina: WPCountry {
        return WPCountry(systemName: "Argentina", isoCode: "AR", continent: .SouthAmerica, population: 45_376_763, area: 2_780_400)
    }
    
    public static var Bolivia: WPCountry {
        return WPCountry(systemName: "Bolivia", isoCode: "BO", continent: .SouthAmerica, population: 11_673_021, area: 1_098_581)
    }
    
    public static var Brazil: WPCountry {
        return WPCountry(systemName: "Brazil", isoCode: "BR", continent: .SouthAmerica, population: 211_049_527, area: 8_515_767)
    }
    
    public static var Chile: WPCountry {
        return WPCountry(systemName: "Chile", isoCode: "CL", continent: .SouthAmerica, population: 19_116_201, area: 756_102)
    }
    
    public static var Colombia: WPCountry {
        return WPCountry(systemName: "Colombia", isoCode: "CO", continent: .SouthAmerica, population: 50_882_891, area: 1_141_748)
    }
    
    public static var Ecuador: WPCountry {
        return WPCountry(systemName: "Ecuador", isoCode: "EC", continent: .SouthAmerica, population: 17_643_054, area: 283_561)
    }
    
    public static var Guyana: WPCountry {
        return WPCountry(systemName: "Guyana", isoCode: "GY", continent: .SouthAmerica, population: 786_552, area: 214_969)
    }
    
    public static var Paraguay: WPCountry {
        return WPCountry(systemName: "Paraguay", isoCode: "PY", continent: .SouthAmerica, population: 7_132_538, area: 406_752)
    }
    
    public static var Peru: WPCountry {
        return WPCountry(systemName: "Peru", isoCode: "PE", continent: .SouthAmerica, population: 32_971_854, area: 1_285_216)
    }
    
    public static var Suriname: WPCountry {
        return WPCountry(systemName: "Suriname", isoCode: "SR", continent: .SouthAmerica, population: 586_632, area: 163_820)
    }
    
    public static var Uruguay: WPCountry {
        return WPCountry(systemName: "Uruguay", isoCode: "UY", continent: .SouthAmerica, population: 3_473_730, area: 176_215)
    }
    
    public static var Venezuela: WPCountry {
        return WPCountry(systemName: "Venezuela", isoCode: "VE", continent: .SouthAmerica, population: 28_435_940, area: 916_445)
    }
    
}

