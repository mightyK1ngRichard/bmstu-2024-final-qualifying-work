//
//  RootView.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 04.01.2025.
//  Copyright © 2025 https://github.com/mightyK1ngRichard. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @State var viewModel: RootDisplayLogic & RootViewModelOutput
    @State var startScreenControl = StartScreenControl()
    @State var coordinator = Coordinator()

    var body: some View {
        NavigationStack(path: $coordinator.navPath) {
            mainContainer.navigationDestination(for: RootModel.Screens.self) { screen in
                openNextScreen(for: screen)
            }
        }
        .tint(.primary)
        .environment(startScreenControl)
        .environment(coordinator)
    }
}

// MARK: - Navigation Destination

private extension RootView {
    @ViewBuilder
    func openNextScreen(for screen: RootModel.Screens) -> some View {
        switch screen {
        case let .details(cakeModel):
            viewModel.assemblyDetailsView(model: cakeModel)
        }
    }
}

// MARK: - Preview

#Preview {
    RootView(
        viewModel: RootViewModelMock()
    )
    .environment(Coordinator())
}
