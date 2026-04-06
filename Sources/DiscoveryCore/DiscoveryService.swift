import DNSServiceDiscovery
import Dispatch
import Foundation
import ServiceDiscovery

public final class DiscoveryService: Sendable {

  @MainActor
  public static let shared = DiscoveryService()

  private let dns = DNSServiceDiscovery()
  // private var token: CancellationToken?

  // needs Adwaita, which polutes this lib. How to make reactive without depending on Adwaita?
  // maybe only make this service "polling"
  // @State
  @MainActor
  public private(set) var services: [DnsService] = []

  public func start() async {
    // print("START!")
    do {
      let instances = try await dns.lookup(DNSServiceQuery(type: .dnsSdServices))
      await self.handle(instances: instances)
    } catch {
      print("Error: \(error)")
    }
  }

  private func handle(instances: [DNSServiceInstance]) async {
    for instance in instances {
      let service = DnsService(name: instance.name)
      // print("SERVICE:")
      // print("NAME: \(instance.name) \(instance.domain)")
      // print("INFO: \(instance)")
      // print("===")
      await handle(service: service)
    }
  }

  private func handle(service: DnsService) async {
    await handleMainActor(service: service)
  }

  @MainActor
  private func handleMainActor(service: DnsService) {
    if !services.contains(service) {
      services.append(service)
    }
  }

  deinit {
    // print("DEINIT!")
  }
}

