//
//  Mini_8_CoreMLApp.swift
//  Mini-8-CoreML
//
//  Created by Lucca Lopes on 31/10/23.
//

import SwiftUI

@main
struct Mini_8_CoreMLApp: App {
    var body: some Scene {
        WindowGroup {
            GeometryReader{ geo in
                ContentView()
                    .environment(\.screenSize, geo.size)
            }
        }
    }
}

private struct ScreenSizeKey : EnvironmentKey {
    static let defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var screenSize: CGSize {
        get { self[ScreenSizeKey.self] }
        set { self[ScreenSizeKey.self] = newValue }
    }
}

