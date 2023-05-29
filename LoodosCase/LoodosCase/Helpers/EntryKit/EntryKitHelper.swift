//
//  EntryKitHelper.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation
import SwiftEntryKit

public struct EntryKitHelper {
    
    static func attributes() -> EKAttributes {
        var attributes = EKAttributes.centerFloat
        attributes.hapticFeedbackType = .success
        attributes.windowLevel = .alerts
        attributes.position = .top
        attributes.displayMode = .inferred
        return attributes
    }
    
    static func centerAttributed(with bgColorOpacity: CGFloat = 1.0) -> EKAttributes {
        var attributes = EKAttributes.centerFloat
        attributes.entryBackground = .color(color: EKColor(.white))
        attributes.entranceAnimation = .none
        attributes.screenInteraction = .absorbTouches
        attributes.exitAnimation = .none
        attributes.displayDuration = .infinity
        attributes.windowLevel = .custom(level: UIWindow.Level.init(0))
        attributes.position = .center
        attributes.roundCorners = .all(radius: 8)
        attributes.screenBackground = .color(color: EKColor(.black.withAlphaComponent(0.4)))
        attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 10, offset: .zero))
        attributes.entryInteraction.defaultAction = .absorbTouches
        return attributes
    }

    static func showLoading() {
        let view = LottieView()
        SwiftEntryKit.display(entry: view, using: centerAttributed(with: 0.4))
    }
    
    static func dismiss() {
        SwiftEntryKit.dismiss()
    }
}
