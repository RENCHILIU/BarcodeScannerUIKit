//
//  SceneDelegate.swift
//  BarcodeScannerUIKitTest
//
//  Created by Renchi Liu on 4/9/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navVC = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
}
