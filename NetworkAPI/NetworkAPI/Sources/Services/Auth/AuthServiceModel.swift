//
//  AuthServiceModel.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 09.02.2025.
//

import Foundation

public enum AuthServiceModel {
    public enum Register {}
}

// MARK: - Register

public extension AuthServiceModel.Register {
    struct Request {
        var email: String
        var password: String

        public init(
            email: String,
            password: String
        ) {
            self.email = email
            self.password = password
        }
    }

    struct Response {
        var accessToken: String
        var refreshToken: String
        var expiresIn: Int

        public init(
            accessToken: String,
            refreshToken: String,
            expiresIn: Int
        ) {
            self.accessToken = accessToken
            self.refreshToken = refreshToken
            self.expiresIn = expiresIn
        }
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
