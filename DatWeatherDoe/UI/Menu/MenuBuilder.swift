//
//  MenuBuilder.swift
//  DatWeatherDoe
//
//  Created by Inder Dhir on 1/11/22.
//  Copyright © 2022 Inder Dhir. All rights reserved.
//

import Cocoa

final class MenuBuilder {
    
    private let options: MenuBuilderOptions
    
    init(options: MenuBuilderOptions) {
        self.options = options
    }
    
    func build() -> NSMenu {
        let menu = NSMenu()
        buildLocationOptions().forEach {
            menu.addItem($0)
        }
        buildMainOptions().forEach {
            menu.addItem($0)
        }
        return menu
    }
    
    private func buildLocationOptions() -> [NSMenuItem] {
        [
            buildUnknownLocationMenuItem(),
            .separator(),
            buildSeeFullWeatherMenuItem(),
            .separator()
        ]
    }
    
    private func buildMainOptions() -> [NSMenuItem] {
        [
            buildRefreshMenuItem(),
            buildConfigureMenuItem(),
            buildQuitMenuItem()
        ]
    }
    
    private func buildUnknownLocationMenuItem() -> NSMenuItem {
        .init(
            title: NSLocalizedString("Unknown Location", comment: "Unknown weather location"),
            action: nil,
            keyEquivalent: ""
        )
    }
    
    private func buildSeeFullWeatherMenuItem() -> NSMenuItem {
        .init(
            title: NSLocalizedString("See Full Weather", comment: "See Full Weather"),
            action: options.seeFullWeatherSelector,
            keyEquivalent: "F"
        )
    }
    
    private func buildRefreshMenuItem() -> NSMenuItem {
        .init(
            title: NSLocalizedString("Refresh", comment: "Refresh weather"),
            action: options.refreshSelector,
            keyEquivalent: "R"
        )
    }
    
    private func buildConfigureMenuItem() -> NSMenuItem {
        .init(
            title: NSLocalizedString("Configure", comment: "Configure app"),
            action: options.configureSelector,
            keyEquivalent: "C"
        )
    }
    
    private func buildQuitMenuItem() -> NSMenuItem {
        .init(
            title: NSLocalizedString("Refresh", comment: "Refresh weather"),
            action: options.quitSelector,
            keyEquivalent: "q"
        )
    }
}
