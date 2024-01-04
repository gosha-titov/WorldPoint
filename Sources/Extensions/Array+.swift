extension Array where Element == WPCountry {
    
    /// Returns the array of countries sorted by population.
    public var sortedByPopulation: [WPCountry] {
        return sorted { $0.population > $1.population }
    }
    
    /// Returns the array of countries sorted by area.
    public var sortedByArea: [WPCountry] {
        return sorted { $0.area > $1.area }
    }
    
    /// Returns the first K countries of this array.
    public func top(_ k: Int) -> [WPCountry] {
        guard k > 0 else { return [] }
        let k = k > count ? count : k
        var array = [Element]()
        for i in 0..<k {
            array.append(self[i])
        }
        return array
    }
    
}
