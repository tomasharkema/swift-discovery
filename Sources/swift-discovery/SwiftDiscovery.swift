import Adwaita

@main
struct SwiftDiscovery: App {

    let id = "io.harkema.SwiftDiscovery"
    var app: GTUIApp!

    var scene: Scene {
        Window(id: "main") { window in
            Text("Hallo")
                .padding()
                .topToolbar {
                    ToolbarView(app: app, window: window)
                }
        }
        .defaultSize(width: 450, height: 300)
        
    }

}