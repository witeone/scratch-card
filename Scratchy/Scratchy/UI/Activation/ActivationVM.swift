//
//  ActivationVM.swift
//  Scratchy
//
//  Created by Marek Polak on 26/03/2024.
//

import Foundation

class ActivationVM: ObservableObject {
    @Published var error = false

    func activate(card: CardModel) async throws {
        guard !card.cardId.isEmpty,
        let url = URL(string: "https://api.o2.sk/versions?code=\(card.cardId)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let (data, response) = try await URLSession.shared.data(for: request)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else { return }
        let decoded = try JSONDecoder().decode(ActivationResponseModel.self, from: data)

        DispatchQueue.main.async { [weak self] in
            card.version = Double(decoded.ios)
            if !card.activated {
                self?.error = true
            }
        }
    }
}
