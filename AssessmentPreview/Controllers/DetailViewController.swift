import UIKit
import ReactiveSwift
import ReactiveJSON

class DetailViewController: UIViewController {
    fileprivate var tableView:UITableView!
    fileprivate let cellIdentifier = "Cell"
    
    typealias Dict = [String:Any]
    typealias _Signal = Signal<Any,NetworkError>
    
    var itemsProperty:MutableProperty<[EntryItem]> = MutableProperty<[EntryItem]>([])
    private var disposebag:Disposable? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        networkingStuff()
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self , forCellReuseIdentifier: cellIdentifier)
        tableView.tableFooterView = UIView()
        view.addSubview(tableView)
    }
    
    private func anyToVehicles(_ value:Any) -> [EntryItem]? {
        let results = (value as? Dict)?["results"] as? NSArray
        return results?.flatMap({ EntryItem($0 as? Dict)})
    }
    
    private var mySignal:_Signal? = nil {
        didSet {
            mySignal?.signal.observeResult {[weak self] result in
                guard let strongSelf  = self else { return }
                switch result {
                case .success(let _value):
                    //transform
                    guard let vehicles = self?.anyToVehicles(_value)
                        else { return }
                    let vehiclesProperty = MutableProperty(vehicles)
                    
                    // bind (update )
                    strongSelf.itemsProperty <~  vehiclesProperty
                    DispatchQueue.main.async {
                        strongSelf.tableView.reloadData()
                    }
                    
                case .failure(_): break
                }
            }
        }
    }
    /*
     - request
     -> signalProducer
     -> signal
     -> value
     */
    
    private func networkingStuff() {
        let stringEndpoint = String(describing:RequestMaster.endpoints.people)
        
        let signalProducer:SignalProducer<Any, NetworkError> = RequestMaster.request(endpoint: stringEndpoint)
        
        // get signal from producer
        signalProducer.startWithSignal { (innerSignal, disposeBag) in
            mySignal = innerSignal
            disposebag = disposeBag
        }
    }
    
    deinit {
        disposebag?.dispose()
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = itemsProperty.value[indexPath.row].model.value
        return cell
    }
}

extension DetailViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsProperty.value.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

