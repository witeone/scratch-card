//
//  CardView.swift
//  Scratchy
//
//  Created by Marek Polak on 25/03/2024.
//

import SwiftUI

struct CardView: View {
    var title: String? = nil
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .blue.opacity(0.25),
                            .mint.opacity(0.25)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))

            Text({
                if let title {
                    title
                } else {
                    "Scratch to reveal your code!"
                }
            }())
            .padding()
        }
        .frame(width: 250, height: 250)
    }
}

#Preview {
    CardView()
}
