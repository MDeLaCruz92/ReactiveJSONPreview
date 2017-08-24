import UIKit
import ReactiveSwift
import ReactiveJSON

class VehicleController: PeopleController {
    
    override func networkSignal() {
        let fetchEndpoint = String(describing: Endpoints.vehicles)
        let signalProducer:SignalProducer<Any, NetworkError> = RequestMaster.request(endpoint: fetchEndpoint)
        
        // get signal from producer
        signalProducer.startWithSignal { (innerSignal, disposeBag) in
            mySignal = innerSignal
            disposebag = disposeBag
        }
    }
    
}


