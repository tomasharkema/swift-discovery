import DNSServiceDiscovery
import Adwaita
import Dispatch
import Foundation
import ServiceDiscovery


final actor DiscoveryService {
    
    static let shared = DiscoveryService()
    
    private let dns = DNSServiceDiscovery()
    private var token: CancellationToken?

    @State
    var hosts: [String] = []

    func start() {
        print("START!")
        token = dns.subscribe(to: DNSServiceQuery(type: .dnsSdServices), onNext: { result in
            print(result)
        }, onComplete: {
            print($0)
        })
    }

    deinit {
        print("DEINIT!")
    }

}
