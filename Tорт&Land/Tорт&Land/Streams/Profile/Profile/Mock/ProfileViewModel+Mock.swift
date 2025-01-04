//
//  ProfileViewModel+Mock.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 03.01.2025.
//  Copyright © 2025 https://github.com/mightyK1ngRichard. All rights reserved.
//

#if DEBUG

import Foundation
import Observation

@Observable
final class ProfileViewModelMock: ProfileDisplayLogic & ProfileViewModelOutput {
    var uiProperties = ProfileModel.UIProperties()
    private(set) var user: UserModel
    private(set) var isCurrentUser: Bool
    @ObservationIgnored
    private var coordinator: Coordinator?

    init(isCurrentUser: Bool = false) {
        var userInfo = CommonMockData.generateMockUserModel(id: 1, name: "Пермяков Дмитрий")
        userInfo.cakes = (1...10).map { CommonMockData.generateMockCakeModel(id: $0) }
        self.user = userInfo
        self.isCurrentUser = isCurrentUser
    }

    func setEnvironmentObjects(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}

// MARK: - Actions

extension ProfileViewModelMock {
    func didTapCakeCard(with cake: CakeModel) {
        print("[DEBUG]: did tap cake with id=\(cake.id)")
    }

    func didTapCreateProduct() {
        print("[DEBUG]: \(#function)")
    }

    func didTapOpenSettings() {
        print("[DEBUG]: \(#function)")
    }

    func didTapOpenMap() {
        print("[DEBUG]: \(#function)")
    }

    func didTapWriteMessage() {
        print("[DEBUG]: \(#function)")
    }

    func didTapCakeLikeButton(cake: CakeModel, isSelected: Bool) {
        print("[DEBUG]: cake with id=\(cake.id) is \(isSelected ? "liked" : "unliked")")
    }
}

// MARK: - Configurations

extension ProfileViewModelMock {
    func configureAvatarImage() -> TLImageView.Configuration {
        .init(imageState: user.avatarImage)
    }

    func configureHeaderImage() -> TLImageView.Configuration {
        .init(imageState: user.headerImage)
    }

    func configureProductCard(for cake: CakeModel) -> TLProductCard.Configuration {
        cake.configureProductCard()
    }
}

#endif
