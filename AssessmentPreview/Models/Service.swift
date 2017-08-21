//
//  Service.swift
//  AssessmentPreview
//
//  Created by Michael De La Cruz on 8/21/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveJSON

struct RequestMaster: Singleton,ServiceHost {
    // Instance is an associate value that is setting the shared property
    typealias Instance  = RequestMaster
    private(set) static var shared = Instance()
    
    
    static var scheme: String { return "https" }
    static var host: String { return "swapi.co" }
    static var path: String? { return "api"}
    
    enum endpoints {
        case vehicles
        case people
        case starships
    }
}
