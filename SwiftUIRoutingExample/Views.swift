//
//  Views.swift
//  SwiftUIRoutingExample
//

import Foundation
import SwiftUI


// MARK: screen A

protocol ScreenARouting: AnyObject {
    
    func goToNextScreen()
    func dismissFlow()
}

final class ScreenAViewModel {
    
    let displayText = "Screen A"
    private let router: ScreenARouting
    
    init(router: ScreenARouting) {
        self.router = router
    }
    
    func nextButtonTapped() {
        self.router.goToNextScreen()
    }
    
    func dismissButtonTapped() {
        self.router.dismissFlow()
    }
}

struct ScreenAView: View {
    
    let viewModel: ScreenAViewModel
        
    var body: some View {
        VStack {
            Text(self.viewModel.displayText)
            
            Button("Go to next screen") {
                self.viewModel.nextButtonTapped()
            }
            
            Button("Dismiss") {
                self.viewModel.dismissButtonTapped()
            }
        }
    }
}

// MARK: screen B

protocol ScreenBRouting: AnyObject {
    
    func displayNextScreen()
    func goBack()
}

final class ScreenBViewModel {
    
    let displayText = "Screen B"
    private let router: ScreenBRouting
    
    init(router: ScreenBRouting) {
        self.router = router
    }
    
    func openButtonTapped() {
        self.router.displayNextScreen()
    }
    
    func backButtonTapped() {
        self.router.goBack()
    }
}

struct ScreenBView: View {
    
    let viewModel: ScreenBViewModel
    
    var body: some View {
        VStack {
            Text(self.viewModel.displayText)

            Button("Open next screen") {
                self.viewModel.openButtonTapped()
            }
            
            Button("Back") {
                self.viewModel.backButtonTapped()
            }
        }
    }
}

// MARK: screen C

protocol ScreenCRouting: AnyObject {
    
    func dismissPresentedScreen()
}

final class ScreenCViewModel {
    
    let displayText = "Screen C"
    private let router: ScreenCRouting
    
    init(router: ScreenCRouting) {
        self.router = router
    }
    
    func dismissButtonTapped() {
        self.router.dismissPresentedScreen()
    }
}

struct ScreenCView: View {
    
    let viewModel: ScreenCViewModel
    
    var body: some View {
        VStack {
            Text(self.viewModel.displayText)
            
            Button("Dismiss") {
                self.viewModel.dismissButtonTapped()
            }
        }
    }
}
