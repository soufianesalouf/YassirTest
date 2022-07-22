//
//  SceneDelegate.swift
//  YassirTest
//
//  Created by Soufiane Salouf on 21/7/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Properties
    
    var window: UIWindow?
    
    // MARK: -
    
    private let appCoordinator = AppCoordinator()
    
    // MARK: - Delegates

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Initialize window and start app coordinator
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = appCoordinator.rootViewController
        window?.makeKeyAndVisible()
        appCoordinator.start()
    }
}

