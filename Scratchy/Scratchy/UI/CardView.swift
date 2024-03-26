//
//  CardView.swift
//  Scratchy
//
//  Created by Marek Polak on 25/03/2024.
//

import SwiftUI

struct CardView: View {
    var title: String
    var isLoading = false
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

            if isLoading {
                ProgressView()
            } else {
                Text({
                    if !title.isEmpty {
                        title
                    } else {
                        "Scratch to reveal your code!"
                    }
                }())
                .foregroundStyle(title.isEmpty ? Color.gray : Color.black)
                .padding()
            }
        }
        .frame(width: 250, height: 250)
    }
}

#Preview {
    CardView(title: "")
}
