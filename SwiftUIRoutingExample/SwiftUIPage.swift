//
//  SwiftUIPage.swift
//  SwiftUIRoutingExample
//

import Foundation
import SwiftUI


class SwiftUIPage<ViewType: View, ViewModelType>: UIHostingController<ViewType> {
    
    let viewModel: ViewModelType
    
    init(rootView: ViewType, viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
