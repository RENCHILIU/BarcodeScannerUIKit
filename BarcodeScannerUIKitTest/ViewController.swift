//
//  ViewController.swift
//  BarcodeScannerUIKitTest
//
//  Created by Renchi Liu on 4/9/25.
//

import UIKit
import BarcodeScannerKit
import AVFoundation
class ViewController: UIViewController {
    
    var scannerVC: ScannerViewController?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        AVCaptureDevice.requestAccess(for: .video) { granted in
            print("Camera access: \(granted)")
        }
        view.backgroundColor = .white
        
        let button = UIButton(type: .system)
        button.setTitle("Open Scanner", for: .normal)
        button.addTarget(self, action: #selector(openScanner), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        scannerVC = ScannerViewController()
        scannerVC?.delegate = self
        
    }
    
    @objc func openScanner() {
        if let vc = scannerVC {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

 extension ViewController: ScannerViewControllerDelegate {
     func scannerViewController(_ controller: ScannerViewController, didScanCode code: String) {
         print("Scanned Code: \(code)")
     }
 }
