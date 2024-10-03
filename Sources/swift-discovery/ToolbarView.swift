import Adwaita

struct ToolbarView: View {

    @State private var about = false
    var app: GTUIApp
    var window: GTUIApplicationWindow

    var view: Body {
        HeaderBar.end {
            Menu(icon: .default(icon: .openMenu), app: app, window: window) {
                MenuButton("New Window", window: false) {
                    app.addWindow("main")
                }
                .keyboardShortcut("n".ctrl())
                MenuButton("Close Window") {
                    window.close()
                }
                .keyboardShortcut("w".ctrl())
                MenuSection {
                    MenuButton("ABOUT", window: false) {
                        about = true
                    }
                }
            }
            .primary()
            .tooltip("MAIN MENU")
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
