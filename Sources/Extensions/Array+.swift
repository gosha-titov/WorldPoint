public extension Array where Element == WPCountry {
    
    /// Returns the array of countries sorted by population.
    @inlinable var sortedByPopulation: [WPCountry] {
        return sorted { $0.population > $1.population }
    }
    
    /// Returns the array of countries sorted by area.
    @inlinable var sortedByArea: [WPCountry] {
        return sorted { $0.area > $1.area }
    }
    
    /// Returns the array of countries sorted by name.
    @inlinable var sortedByName: [WPCountry] {
        return sorted { $0.systemName < $1.systemName }
    }
    
    /// Returns the first K countries of this array.
    @inlinable func top(_ k: Int) -> [WPCountry] {
        guard k > 0 else { return [] }
        let k = k > count ? count : k
        return Array(self[0..<k])
    }
    
}
