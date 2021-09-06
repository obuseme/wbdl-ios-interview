//
//  SceneDelegate.swift
//  WBTask
//
//  Created by Ugur on 02/09/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?

  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }

    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    window?.windowScene = windowScene

    let navigationController = UINavigationController(rootViewController: HomeComicsViewController())
    navigationController.navigationBar.tintColor = StyleProvider.titleColor
    navigationController.navigationBar.standardAppearance = navigationBarAppearance()

    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }

  private func navigationBarAppearance() -> UINavigationBarAppearance {
    let appearance = UINavigationBarAppearance()
    appearance.backgroundColor = StyleProvider.lightBackgroundColor
    appearance.titleTextAttributes = [.foregroundColor: UIColor.white]

    return appearance
  }
}
