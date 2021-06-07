//
//  Router.swift
//  SwiftUIRoutingExample
//

import Foundation
import UIKit


final class Router: ScreenARouting, ScreenBRouting, ScreenCRouting {
    
    let navController: UINavigationController
    
    init() {
        
        self.navController = NavControllerWithHiddenNavBar()
        
        let rootVM = ScreenAViewModel(router: self)
        let rootView = ScreenAView(viewModel: rootVM)
        let rootPage = SwiftUIPage(rootView: rootView, viewModel: rootVM)
        
        self.navController.viewControllers = [rootPage]
    }
    
    // MARK: ScreenARouting
    
    func goToNextScreen() {
        let vm = ScreenBViewModel(router: self)
        let view = ScreenBView(viewModel: vm)
        self.navController.pushViewController(SwiftUIPage(rootView: view, viewModel: vm), animated: true)
    }
    
    // MARK: ScreenBRouting

    func displayNextScreen() {
        let vm = ScreenCViewModel(router: self)
        let view = ScreenCView(viewModel: vm)
        
        self.navController.present(SwiftUIPage(rootView: view, viewModel: vm),
                                   animated: true,
                                   completion: nil)
    }
    
    func goBack() {
        self.navController.popViewController(animated: true)
    }
    
    func dismissFlow() {
        self.navController.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: ScreenCRouting
    
    func dismissPresentedScreen() {
        self.navController.dismiss(animated: true, completion: nil)
    }
}

private class NavControllerWithHiddenNavBar: UINavigationController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.isNavigationBarHidden = true
        self.title = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setNavigationBarHidden(_ hidden: Bool, animated: Bool) {
        super.setNavigationBarHidden(true, animated: animated)
    }
}
