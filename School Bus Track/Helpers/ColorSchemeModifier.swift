//
//  ColorSchemeModifier.swift
//  School Bus Track
//
//  Created by Murat Haktanır on 7.11.2021.
//

import SwiftUI

struct ColorSchemeModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content
        Color(colorScheme == .light ? .systemGroupedBackground : .opaqueSeparator)
            .ignoresSafeArea()
    }
}

