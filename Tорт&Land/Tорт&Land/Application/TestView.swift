//
//  TestView.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 08.02.2025.
//

import SwiftUI

#Preview {
    Button("Show") {
        Task {
            do {
                let res = try await AuthGrpcServiceImpl(configuration: AppHosts.auth).register(
                    req: .init(email: "dimapermyakov56@gmail.com", password: "1234567")
                )
                print("[DEBUG]: \(res)")
            } catch {
                print("[DEBUG]: \(error)")
            }
        }
    }
}
