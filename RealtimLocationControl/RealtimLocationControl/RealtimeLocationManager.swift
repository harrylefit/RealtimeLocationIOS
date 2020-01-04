//
//  RealtimeLocationManager.swift
//  RealtimLocationControl
//
//  Created by Harry Le on 1/4/20.
//  Copyright © 2020 Harry Le. All rights reserved.
//

import Foundation

class RealtimeLocationManager : RealtimeLocationProvider {
    private var intervalTimeForGettingLocations : Int = 5 //seconds
    private var intervalTimeForRequestingLocation : Int = 5 //seconds
    private var provider: RealtimeLocationProvider?
    
    init(_ intervalTimeForGettingLocations: Int,_ intervalTimeForRequestingLocation: Int, provider: RealtimeLocationProvider?) {
        self.intervalTimeForRequestingLocation = intervalTimeForRequestingLocation
        self.intervalTimeForGettingLocations = intervalTimeForGettingLocations
        self.provider = provider
    }
    
    func release() {
        self.provider = nil
    }
    
    func requestToSendLocation(completed: (() -> Void)?) {
        provider?.requestToSendLocation(completed: completed)
    }
    
    func requestToGetLocations(completed: @escaping (([RealtimeLocation]) -> Void?)) -> Array<RealtimeLocation>? {
        provider?.requestToGetLocations(completed: completed)
    }
}
