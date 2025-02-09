//
//  TestView.swift
//  Торт&Land
//
//  Created by Dmitriy Permyakov on 10.02.2025.
//

import SwiftUI
import NetworkAPI

#Preview {
    Button("Tell me") {
        let api = AuthGrpcServiceImpl(configuration: AppHosts.auth)
        Task {
            do {
                let res = try await api.register(
                    req: .init(email: "dimapermyakov55@gmail.com", password: "12345678")
                )
                print("[DEBUG]: \(res)")
            } catch {
                print("[DEBUG]: \(error)")
            }
        }
    }
}
