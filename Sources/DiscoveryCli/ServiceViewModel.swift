import Combine
import DiscoveryCore

@MainActor
final class ServiceViewModel: ObservableObject {
  @Published
  private(set) var services: [DnsService] = []

  func start() async {
    await DiscoveryService.shared.start()

    // could be better, just some temp plumbing here!
    services = DiscoveryService.shared.services
  }
}

