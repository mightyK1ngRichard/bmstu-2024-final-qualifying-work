//
//  AuthServiceModel.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 09.02.2025.
//

import Foundation

enum AuthServiceModel {
    enum Register {}
}

// MARK: - Register

extension AuthServiceModel.Register {
    struct Request {
        var email: String
        var password: String
    }

    struct Response {
        var accessToken: String
        var refreshToken: String
        var expiresIn: Int
    }
}

extension RegisterResponse {
    func convertToRegisterDataGRPC() -> AuthServiceModel.Register.Response {
        .init(
            accessToken: accessToken,
            refreshToken: refreshToken,
            expiresIn: Int(expiresIn)
        )
    }
}
