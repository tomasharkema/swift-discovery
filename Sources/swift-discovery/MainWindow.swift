
import Adwaita

struct MainView: View {

    let app: GTUIApp

    let list = ["a", "b"]

    var view: Body {
        ListBox(list) {
            Text($0)
        }.onAppear {
            print("ON APPEAR!")
            Task { 
                await DiscoveryService.shared.start()
            }  
        }
    }
}

extension String: Identifiable {
    public var id: Int {
        hashValue
    }
}

