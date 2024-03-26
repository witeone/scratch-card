//
//  ScratchVM.swift
//  Scratchy
//
//  Created by Marek Polak on 25/03/2024.
//

import Foundation
import Combine

class ScratchVM: ObservableObject {
    @Published var isLoading = false

    private var cancellables = [AnyCancellable]()

    func scratch(model: CardModel) {
        isLoading = true
        Deferred {
            Just(model)
        }
        .delay(for: .seconds(2), scheduler: DispatchQueue.main)
        .sink { [weak self] card in
            card.cardId = UUID().uuidString
            self?.isLoading = false
        }
        .store(in: &cancellables)
    }
}
