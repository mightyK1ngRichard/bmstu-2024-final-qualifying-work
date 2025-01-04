//
//  CakesListViewModel+Mock.swift
//  Tорт&Land
//
//  Created by Dmitriy Permyakov on 21.12.2024.
//

#if DEBUG

import Foundation
import Observation

@Observable
final class CakesListViewModelMock: CakesListDisplayLogic, CakesListViewModelOutput {
    private(set) var sections: [CakesListModel.Section] = []
    private(set) var screenState: ScreenState = .initial
    @ObservationIgnored
    private var delay: TimeInterval = 0
    @ObservationIgnored
    private var coordinator: Coordinator?

    init(delay: TimeInterval) {
        self.delay = delay
    }

    func fetchData() {
        screenState = .loading
        Task {
            try? await Task.sleep(for: .seconds(delay))
            await MainActor.run {
                sections = [
                    .sale(
                        (1...20).map { CommonMockData.generateMockCakeModel(id: $0) }
                    ),
                    .new(
                        (21...32).map { CommonMockData.generateMockCakeModel(id: $0, withDiscount: false) }
                    ),
                    .all(
                        (33...40).map { CommonMockData.generateMockCakeModel(id: $0, withDiscount: false) }
                    )
                ]
                screenState = .finished
            }
        }
    }

    func didTapNewsAllButton(_ cakes: [CakeModel]) {
        print("[DEBUG]: Нажали секцию news")
        coordinator?.addScreen(CakesListModel.Screens.tags(cakes, .new))
    }

    func didTapSalesAllButton(_ cakes: [CakeModel]) {
        print("[DEBUG]: Нажали секцию sales")
        coordinator?.addScreen(CakesListModel.Screens.tags(cakes, .sales))
    }

    func didTapCell(model: CakeModel) {
        print("[DEBUG]: Нажали на торт: \(model.id)")
        coordinator?.addScreen(CakesListModel.Screens.details(model))
    }

    func didTapLikeButton(model: CakeModel, isSelected: Bool) {
        print("[DEBUG]: Нажали лайк для торта: \(model.id), isSelected: \(isSelected)")
    }
}

// MARK: - Configuration

extension CakesListViewModelMock {
    func assemblyDetailsView(model: CakeModel) -> CakeDetailsView {
        let viewModel = CakeDetailsViewModelMock(cakeModel: model)
        return CakeDetailsView(viewModel: viewModel)
    }

    func assemblyTagsView(cakes: [CakeModel], sectionKind: ProductsGridModel.SectionKind) -> ProductsGridView {
        let viewModel = ProductsGridViewModelMock(cakes: cakes, sectionKind: sectionKind)
        return ProductsGridView(viewModel: viewModel)
    }

    func configureShimmeringProductCard() -> TLProductCard.Configuration {
        .shimmering(imageHeight: 184)
    }

    func configureProductCard(model: CakeModel, section: CakesListModel.Section) -> TLProductCard.Configuration {
        return model.configureProductCard()
    }
}

// MARK: - Setter

extension CakesListViewModelMock {
    func setEnvironmentObjects(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}

#endif
