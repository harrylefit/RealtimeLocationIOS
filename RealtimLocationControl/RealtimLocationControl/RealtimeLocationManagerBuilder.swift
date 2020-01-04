//
//  RealtimeLocationManagerBuilder.swift
//  RealtimLocationControl
//
//  Created by Harry Le on 1/4/20.
//  Copyright © 2020 Harry Le. All rights reserved.
//

import Foundation

class RealtimeLocationManagerBuilder {
    private var intervalTimeForGettingLocations : Int = 5 //seconds
    private var intervalTimeForRequestingLocation : Int = 5 //seconds
    private var realtimeLocationProvider : RealtimeLocationProvider?
    
    @discardableResult
    func periodTimeForGettingLocations(intervalTime : Int) -> RealtimeLocationManagerBuilder {
        self.intervalTimeForGettingLocations = intervalTime
        return self
    }
    
    @discardableResult
    func periodTimeForRequestingLocation(intervalTime: Int) -> RealtimeLocationManagerBuilder {
        self.intervalTimeForRequestingLocation = intervalTime
        return self
    }
    
    @discardableResult
    func realtimeLocationProvider(provider: RealtimeLocationProvider?) -> RealtimeLocationManagerBuilder {
        self.realtimeLocationProvider = provider
        return self
    }
    
    func build() -> RealtimeLocationManager {
        return RealtimeLocationManager(intervalTimeForGettingLocations,intervalTimeForRequestingLocation,
            provider: realtimeLocationProvider)
    }
}
