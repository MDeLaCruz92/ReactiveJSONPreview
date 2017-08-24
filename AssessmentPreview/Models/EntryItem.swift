//
//  EntryItem.swift
//  AssessmentPreview
//
//  Created by Michael De La Cruz on 8/21/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import UIKit
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

struct Entity {
    var img: UIImage
    var title: String
}

class EntryModel {
    
    init() {}
    
    func start() -> [Entity] {
        return [
            Entity(img: UIImage(named: "icon-characters.png")!, title: String(describing: Endpoints.people)),
            Entity(img: UIImage(named: "icon-starships.png")!, title: String(describing: Endpoints.starships)),
            Entity(img: UIImage(named: "icon-vehicles.png")!, title: String(describing: Endpoints.vehicles))
        ]
    }
}
