public struct DnsService: Sendable {
  public let name: String
}

extension DnsService: Identifiable {
  public var id: String {
    name
  }
}

extension DnsService: Equatable {
  public static func == (lhs: DnsService, rhs: DnsService) -> Bool {
    return lhs.name == rhs.name
  }
}

