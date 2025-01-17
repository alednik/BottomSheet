//
//  BottomSheetArray.swift
//
//  Created by Lucas Zischka.
//  Copyright © 2021 Lucas Zischka. All rights reserved.
//

import SwiftUI

internal extension Array where Element == BottomSheet.Options {
    var allowContentDrag: Bool {
        return self.contains(BottomSheet.Options.allowContentDrag)
    }
    
    var animation: Animation {
        var animation: Animation = Animation.spring(response: 0.5, dampingFraction: 0.75, blendDuration: 1)
        
        self.forEach { item in
            if case .animation(let customAnimation) = item {
                animation = customAnimation
            }
        }
        
        return animation
    }
    
    var appleScrollBehavior: Bool {
        return self.contains(BottomSheet.Options.appleScrollBehavior)
    }
    
    var innerBackground: AnyView {
        var background = AnyView(EffectView(effect: UIBlurEffect(style: .systemMaterial)))
        
        self.forEach { item in
            if case .innerBackground(let customBackground) = item {
                background = customBackground
            }
        }
        
        return background
    }
    
    var outerBackground: AnyView? {
        var background: AnyView?
        
        self.forEach { item in
            if case .outerBackground(let customBackground) = item {
                background = customBackground
            }
        }
        
        return background
    }
    
    var cornerRadius: CGFloat {
        var cornerRadius: CGFloat = 10.0
        
        self.forEach { item in
            if case .cornerRadius(let customCornerRadius) = item {
                cornerRadius = CGFloat(customCornerRadius)
            }
        }
        
        return cornerRadius
    }
    
    var dragIndicatorColor: Color {
        var dragIndicatorColor: Color = Color(UIColor.tertiaryLabel)
        
        self.forEach { item in
            if case .dragIndicatorColor(let customDragIndicatorColor) = item {
                dragIndicatorColor = customDragIndicatorColor
            }
        }
        
        return dragIndicatorColor
    }
    
    var noBottomPosition: Bool {
        return self.contains(BottomSheet.Options.noBottomPosition)
    }
    
    var noDragIndicator: Bool {
        return self.contains(BottomSheet.Options.noDragIndicator)
    }
    
    var notResizeable: Bool {
        return self.contains(BottomSheet.Options.notResizeable)
    }
    
    var shadowColor: Color {
        var shadowColor: Color = .clear
        
        self.forEach { item in
            if case .shadow(color: let customShadowColor, radius: _, x: _, y: _) = item {
                shadowColor = customShadowColor
            }
        }
        
        return shadowColor
    }
    
    var shadowRadius: CGFloat {
        var shadowRadius: CGFloat = 0
        
        self.forEach { item in
            if case .shadow(color: _, radius: let customShadowRadius, x: _, y: _) = item {
                shadowRadius = customShadowRadius
            }
        }
        
        return shadowRadius
    }
    
    var shadowX: CGFloat {
        var shadowX: CGFloat = 0
        
        self.forEach { item in
            if case .shadow(color: _, radius: _, x: let customShadowX, y: _) = item {
                shadowX = customShadowX
            }
        }
        
        return shadowX
    }
    
    var shadowY: CGFloat {
        var shadowY: CGFloat = 0
        
        self.forEach { item in
            if case .shadow(color: _, radius: _, x: _, y: let customShadowY) = item {
                shadowY = customShadowY
            }
        }
        
        return shadowY
    }
    
    var showCloseButton: Bool {
        return self.contains(BottomSheet.Options.showCloseButton())
    }
    
    var closeAction: () -> Void {
        var closeAction: () -> Void = {}
        
        self.forEach { item in
            if case .showCloseButton(action: let customCloseAction) = item {
                closeAction = customCloseAction
            }
        }
        
        return closeAction
    }
    
    var swipeToDismiss: Bool {
        return self.contains(BottomSheet.Options.swipeToDismiss)
    }
    
    var tapToDismiss: Bool {
        return self.contains(BottomSheet.Options.tapToDissmiss)
    }
}
