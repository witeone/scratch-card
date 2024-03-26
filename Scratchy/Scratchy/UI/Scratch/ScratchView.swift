//
//  ScratchView.swift
//  Scratchy
//
//  Created by Marek Polak on 25/03/2024.
//

import SwiftUI
import Foundation

struct ScratchView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.isPresented) var isPresented
    @ObservedObject var viewModel: ScratchVM
    let card: CardModel
    var body: some View {
        VStack(spacing: 12) {
            CardView(title: card.cardId, isLoading: viewModel.isLoading)

            Button(action: {
                viewModel.scratch(model: card)
            }, label: {
                HStack(spacing: 12) {
                    Text("Scratch")
                }
            }).disabled(viewModel.isLoading)

            Spacer()
        }
        .onChange(of: isPresented) { oldValue, newValue in
            if !newValue {
                viewModel.cancel()
            }
        }
    }
}

#Preview {
    ScratchView(
        viewModel: ScratchVM(),
        card: .init(cardId: "")
    )
}
