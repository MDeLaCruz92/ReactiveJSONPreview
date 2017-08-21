//
//  EntryItem.swift
//  AssessmentPreview
//
//  Created by Michael De La Cruz on 8/21/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import Foundation
import ReactiveSwift
import ReactiveJSON

struct EntryItem {
    let model:MutableProperty<String>
    
    init?(_ dict:[String:Any]?) {
        guard let nameModel = dict,
            let model = nameModel["name"] as? String
            else { return nil }
        self.model = MutableProperty(model)
    }
}
