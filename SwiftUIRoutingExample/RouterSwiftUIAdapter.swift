//
//  RouterSwiftUIAdapter.swift
//  SwiftUIRoutingExample
//


import Foundation
import SwiftUI

struct RouterSwiftUIAdapter: UIViewControllerRepresentable {
    
    func makeCoordinator() -> Router {
        return Router()
    }
    
    func makeUIViewController(context: Context) -> UINavigationController {
        
        let result = context.coordinator.navController
        return result
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
    }
}
