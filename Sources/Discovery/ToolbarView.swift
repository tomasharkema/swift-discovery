import Adwaita

struct ToolbarView: View {

  @State private var about = false

  var app: AdwaitaApp
  var window: AdwaitaWindow

  var view: Body {
    HeaderBar.end {
      Menu(icon: .default(icon: .openMenu)) {
        //                MenuButton("New Window", window: false) {
        //                    app.addWindow("main")
        //                }
        //                .keyboardShortcut("n".ctrl())
        //                MenuButton("Close Window") {
        //                    window.close()
        //                }
        //                .keyboardShortcut("w".ctrl())
        MenuSection {
          MenuButton("About", window: false) {
            about = true
          }
        }
      }
      .primary()
      .tooltip("Main Menu")
      .aboutDialog(
        visible: $about,
        app: "AdwaitaTemplate",
        developer: "david-swift",
        version: "dev",
        icon: .custom(name: "io.github.AparokshaUI.AdwaitaTemplate"),
        website: .init(string: "https://github.com/AparokshaUI/AdwaitaTemplate")!,
        issues: .init(string: "https://github.com/AparokshaUI/AdwaitaTemplate/issues")!
      )
    }
  }

}

