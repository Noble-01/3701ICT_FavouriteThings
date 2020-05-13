//
//  Keyboard.swift
//  FavouriteThings
//
//  Created by Zac Cripps on 3/5/20.
//  Copyright © 2020 Zac Cripps. All rights reserved.
//

import Foundation
import SwiftUI
struct Keyboard : ViewModifier {
    //var for offset
    @State var offset : CGFloat = 0
    func body (content: Content) -> some View {
        content.padding(.bottom, offset).onAppear{
            //when keybaord appears on screen offset screen from keyboard
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) {
                (notification) in
                let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                
                self.offset = height
            }
            //when keyboard disappears remove offset
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) {
                (notification) in
                self.offset = 0
            }
        }
    }
}
