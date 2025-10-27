//
//  ThemeManager.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 13/10/2025.
//

import UIKit

class ThemeManager {
    static let shared = ThemeManager()
    private init() {}
    var isLightMode = true
    func changeTheme() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        let windows = windowScene.windows
        if isLightMode {
            windows.forEach { $0.overrideUserInterfaceStyle = .dark }
            isLightMode = false
        }else {
            windows.forEach { $0.overrideUserInterfaceStyle = .light }
            isLightMode = true
        }
    }
    
    
    func changeThemeButtonIcon(button: UIButton) {
        if isLightMode {
            button.setImage(ImageManager.darkIcon, for: .normal)
        }else{
            button.setImage(ImageManager.lightIcon, for: .normal)
        }
    }
}
