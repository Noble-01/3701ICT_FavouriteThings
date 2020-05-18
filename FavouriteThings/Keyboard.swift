//
//  Keyboard.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 3/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import Foundation
import SwiftUI
///struct is modifies the view of the context
struct Keyboard : ViewModifier {
    ///var for offset with type floating-point scalar values in Core Graphics and related frameworks
    @State var offset : CGFloat = 0
    func body (content: Content) -> some View {
        content.padding(.bottom, offset).onAppear{
            ///when keybaord appears on screen, offset screen from keyboard
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) {
                (notification) in
                ///safely unwraps value retrieved from the keyboard frame
                guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
                let height = value.height
                ///offset value for view
                self.offset = height
            }
            ///when keyboard disappears reset offset back to zero which lowers the view
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) {
                (notification) in
                self.offset = 0
            }
        }
    }
}
