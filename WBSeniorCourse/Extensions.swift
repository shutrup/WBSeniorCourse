//
//  Extensions.swift
//  WBSeniorCourse
//
//  Created by Шарап Бамматов on 20.07.2024.
//

import Foundation

extension Bundle {
    private static var onLanguageDispatchOnce: () -> Void = {
        let originalSelector = #selector(localizedString(forKey:value:table:))
        let swizzledSelector = #selector(swizzled_localizedString(forKey:value:table:))
        
        let originalMethod = class_getInstanceMethod(Bundle.self, originalSelector)
        let swizzledMethod = class_getInstanceMethod(Bundle.self, swizzledSelector)
        
        if let originalMethod = originalMethod, let swizzledMethod = swizzledMethod {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
        
        return {}
    }()
    
    static func setLanguage(_ language: String) {
        self.onLanguageDispatchOnce()
        
        if let path = Bundle.main.path(forResource: language, ofType: "lproj"), let bundle = Bundle(path: path) {
            objc_setAssociatedObject(Bundle.main, &bundleKey, bundle, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        } else {
            objc_setAssociatedObject(Bundle.main, &bundleKey, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    @objc func swizzled_localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = objc_getAssociatedObject(self, &bundleKey) as? Bundle {
            return bundle.swizzled_localizedString(forKey: key, value: value, table: tableName)
        } else {
            return self.swizzled_localizedString(forKey: key, value: value, table: tableName)
        }
    }
}

private var bundleKey: UInt8 = 0
