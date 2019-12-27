import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow()
        let viewController = TableViewController()
        window.rootViewController = UINavigationController(rootViewController: viewController)
        window.makeKeyAndVisible()
        self.window = window
        return true
    }

}

