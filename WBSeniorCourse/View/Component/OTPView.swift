//
//  OTPView.swift
//  WBAuthScreens
//
//  Created by Шарап Бамматов on 04.07.2024.
//

import SwiftUI

struct OTPView: View {
    @Binding var text: String
    @FocusState var isKeyboardShowing

    @State private var shakeTrigger: Bool = false

    private let otpState: OTPState
    
    private var backgroundColor: Color {
        switch otpState {
        case .none, .loading:
            return .clear
        case .failure:
            return .wbRed
        case .success:
            return .wbGreen
        }
    }

    init(
        text: Binding<String>,
        otpState: OTPState
    ) {
        self._text = text
        self.otpState = otpState
    }

    var body: some View {
        otpNumber
            .onChange(of: otpState) { newValue in
                if newValue == .failure {
                    triggerShake()
                }
            }
    }
}

private extension OTPView {
    var otpNumber: some View {
        VStack(spacing: 12) {
            HStack(spacing: 24) {
                ForEach(0 ..< 4, id: \.self) { index in
                    OTPTextBox(index)
                }
            }
        }
        .overlay {
            errorText
                .offset(y: 65)
        }
        .background {
            TextField("", text: $text.limit(4))
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .frame(width: 1, height: 1)
                .opacity(0.001)
                .blendMode(.screen)
                .focused($isKeyboardShowing)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            isKeyboardShowing.toggle()
        }
        .onAppear {
            isKeyboardShowing = true
        }
        .navigationBarBackButtonHidden()
        .modifier(ShakeEffect(animatableData: shakeTrigger ? 1 : 0))
    }

    @ViewBuilder var errorText: some View {
        if case .failure = otpState {
            Text("Неверный код")
                .font(.mRegular(size: 14))
                .foregroundStyle(.wbRed)
        }
    }

    @ViewBuilder
    func OTPTextBox(_ index: Int) -> some View {
        ZStack {
            Text(characterAt(index))
                .font(.mMedium(size: 36))
                .multilineTextAlignment(.center)
                .foregroundStyle(.wbWhite)
        }
        .frame(width: 64, height: 80)
        .background(.white.opacity(0.08))
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(backgroundColor, lineWidth: 1.0)
        )
        .cornerRadius(12, corners: .allCorners)
    }

    private func characterAt(_ index: Int) -> String {
        guard text.count > index else { return " " }
        return String(text[text.index(text.startIndex, offsetBy: index)])
    }

    private func triggerShake() {
        Task {
            withAnimation(.default) {
                shakeTrigger = true
            }
            try? await Task.sleep(nanoseconds: 500_000_000)
            shakeTrigger = false
        }
    }
}
