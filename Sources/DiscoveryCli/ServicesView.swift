import Combine
import DiscoveryCore
import SwiftTUI

@MainActor
struct ServicesView: @MainActor View {

    @ObservedObject
    private var vm = ServiceViewModel()

    var body: some View {
        if vm.services.count > 0 {
            Text("Bonjour services:\n")
            ScrollView {
                ForEach(vm.services) { service in
                    Text(service.name)
                    Text("===")
                }
            }
        } else {
            Text("Loading...")
                .onAppear {
                    Task {
                        await vm.start()
                    }
                }
        }
    }
}
