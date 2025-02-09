//
//  AuthService.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 07.02.2025.
//

protocol AuthService {
    func register(req: AuthServiceModel.Register.Request) async throws -> AuthServiceModel.Register.Response
    func closeConnection()
}
