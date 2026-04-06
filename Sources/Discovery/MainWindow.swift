import Adwaita
import DiscoveryCore

struct MainView: View {

    let app: AdwaitaApp

    let list = ["a", "b"]

    var view: Body {
        ListBox(list) {
            Text($0)
        }.onAppear {
            print("ON APPEAR!")
            Task {
                await MainActor.run {
                    DiscoveryService.shared.start()
                }
            }
        }
    }
}

extension String: Identifiable {
    public var id: Int {
        hashValue
    }
}
