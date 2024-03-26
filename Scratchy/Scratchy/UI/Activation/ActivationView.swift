//
//  ActivationView.swift
//  Scratchy
//
//  Created by Marek Polak on 26/03/2024.
//

import SwiftUI

struct ActivationView: View {
    let card: CardModel
    @StateObject var viewModel: ActivationVM

    var body: some View {
        VStack {
            Button {
                Task {
                    try await viewModel.activate(card: card)
                }
            } label: {
                Text("Activate")
            }

            if let version = card.version {
                Text("Version: \(version)")
            }
        }
        .alert(isPresented: $viewModel.error) {
            Alert(
                title: Text("Error"),
                message: Text("Activation failed"), 
                dismissButton: .default(Text("Ok"))
            )
        }

    }
}

#Preview {
    ActivationView(
        card: .init(cardId: ""),
        viewModel: .init()
    )
}
