import Adwaita
import DNSServiceDiscovery
import Dispatch
import Foundation
import ServiceDiscovery

final actor DiscoveryService {

    static let shared = DiscoveryService()

    private let dns = DNSServiceDiscovery()
    private var token: CancellationToken?

    @State
    private(set) var hosts: [String] = []

    func start() {
        print("START!")
        token = dns.subscribe(
            to: DNSServiceQuery(type: .dnsSdServices),
            onNext: { result in
                print(result)
            },
            onComplete: {
                print($0)
            })
    }

    private func handle(result: Result<[DNSServiceInstance], any Error>) {
        switch result {
        case .success(let instances):
            handle(instances: instances)
        case .failure(let error):
            print("Caught error:", error)
        }
    }

    private func handle(instances: [DNSServiceInstance]) {
        for instance in instances {
            print("SERVICE:")
            print("NAME: \(instance.name) \(instance.domain)")
            print("INFO: \(instance)")
        }
    }

    deinit {
        print("DEINIT!")
    }

}
