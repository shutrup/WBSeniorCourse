//
//  Font.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 30.06.2024.
//

import SwiftUI

extension Font {
    static func mBold(size: CGFloat) -> Font {
        Font.custom("Montserrat-Bold", fixedSize: size)
    }
    
    static func mItalic(size: CGFloat) -> Font {
        Font.custom("Montserrat-Italic", fixedSize: size)
    }
    
    static func mMedium(size: CGFloat) -> Font {
        Font.custom("Montserrat-Medium", fixedSize: size)
    }
    
    static func mRegular(size: CGFloat) -> Font {
        Font.custom("Montserrat-Regular", fixedSize: size)
    }
    
    static func mSemiBold(size: CGFloat) -> Font {
        Font.custom("Montserrat-SemiBold", fixedSize: size)
    }
}
