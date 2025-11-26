import AuthenticationServices
import Flutter
import UIKit

@available(iOS 16.0, *)
final class WindowProvider {
    static let shared = WindowProvider()
    private init() {}

    func getPresentationAnchor() -> ASPresentationAnchor {
        return getDelegateWindow() ?? getPrimaryWindow() ?? ASPresentationAnchor()
    }

    private func getDelegateWindow() -> UIWindow? {
        guard let delegate = UIApplication.shared.delegate else { return nil }

        if let flutterDelegate = delegate as? FlutterAppDelegate,
           let window = flutterDelegate.window {
            return window
        }

        if let appDelegate = delegate as? NSObject,
           let window = appDelegate.value(forKey: "window") as? UIWindow {
            return window
        }

        return nil
    }

    private func getPrimaryWindow() -> UIWindow? {
        let windows = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            + UIApplication.shared.windows

        return windows.first(where: { $0.isKeyWindow }) ?? windows.first
    }
}
