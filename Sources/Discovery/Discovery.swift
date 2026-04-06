import Adwaita

@main
struct Discovery: App {
  let app = AdwaitaApp(id: "io.harkema.Discovery")

  var scene: Scene {
    Window(id: "main") { window in
      MainView(app: app)
        .padding()
        .topToolbar {
          ToolbarView(app: app, window: window)
        }
    }
    .defaultSize(width: 450, height: 550)
  }
}

