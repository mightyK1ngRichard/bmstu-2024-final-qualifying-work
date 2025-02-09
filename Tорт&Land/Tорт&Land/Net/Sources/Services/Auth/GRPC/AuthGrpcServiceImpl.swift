//
//  AuthGrpcServiceImpl.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 09.02.2025.
//

import Foundation
import GRPC
import NIO

final class AuthGrpcServiceImpl: AuthService {
    private let client: AuthAsyncClientProtocol
    private let channel: GRPCChannel

    init(configuration: GRPCHostPortConfiguration) {
        do {
            let channel = try ConfigProvider.makeConection(
                host: configuration.hostName,
                port: configuration.port,
                numberOfThreads: 1
            )
            let options = ConfigProvider.makeDefaultCallOptions()

            self.client = AuthAsyncClient(
                channel: channel,
                defaultCallOptions: options,
                interceptors: nil
            )
            self.channel = channel
        } catch {
            #if DEBUG
            fatalError("Ошибка подключения к grpc серверу: \(error)")
            #else
            Logger.log(kind: .error, "Ошибка подключения к grpc серверу: \(error)")
            assertionFailure("Ошибка подключения к grpc серверу: \(error)")
            #endif
        }
    }

    func closeConnection() {
        do {
            try channel.close().wait()
        } catch {
            Logger.log(kind: .error, error)
        }
    }
}

extension AuthGrpcServiceImpl {
    func register(req: AuthServiceModel.Register.Request) async throws -> AuthServiceModel.Register.Response {
        let request = RegisterRequest.with {
            $0.email = req.email
            $0.password = req.password
        }
        return try await client.register(request)
            .convertToRegisterDataGRPC()
    }
}
