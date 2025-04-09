//
//  AppDelegate.swift
//  BarcodeScannerUIKitTest
//
//  Created by Renchi Liu on 4/9/25.
//

import UIKit
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navVC = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
        preloadCameraSession()
        return true
    }
    
    func preloadCameraSession() {
        DispatchQueue.global(qos: .userInitiated).async {
            let session = AVCaptureSession()
            guard let device = AVCaptureDevice.default(for: .video),
                  let input = try? AVCaptureDeviceInput(device: device),
                  session.canAddInput(input) else {
                return
            }
            session.addInput(input)
            session.startRunning()
            session.stopRunning()
        }
    }

}
