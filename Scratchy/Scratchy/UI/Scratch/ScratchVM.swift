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
    @Published var completed = false
    private var item: DispatchWorkItem? = nil

    private var cancellables = [AnyCancellable]()

    func scratch(model: CardModel) {
        isLoading = true
        completed = false
        item = DispatchWorkItem { [weak self] in
            model.cardId = UUID().uuidString
            self?.isLoading = false
            self?.completed = true
        }
        if let item {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: item)
        }
    }

    func cancel() {
        item?.cancel()
        isLoading = false
        completed = false
    }
}
