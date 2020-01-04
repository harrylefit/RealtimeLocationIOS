//
//  RealtimeLocationConverter.swift
//  RealtimLocationControl
//
//  Created by Harry Le on 1/4/20.
//  Copyright © 2020 Harry Le. All rights reserved.
//

import Foundation

protocol RealtimeLocationConverter {
    func convertToTargetModel(latitude : Double?, longitude : Double?) -> RealtimeLocation
}
