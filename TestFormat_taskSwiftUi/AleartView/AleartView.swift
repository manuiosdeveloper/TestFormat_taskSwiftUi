//
//  AleartView.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 05/04/25.
//

import Foundation
import SwiftUI



struct CommonAlert: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let primaryButton: Alert.Button
    let secondaryButton: Alert.Button?

    init(title: String, message: String, primary: Alert.Button, secondary: Alert.Button? = nil) {
        self.title = title
        self.message = message
        self.primaryButton = primary
        self.secondaryButton = secondary
    }
}


class AlertViewModel: ObservableObject {
    @Published var commonAlert: CommonAlert?

    func showDeleteConfirmation() {
        commonAlert = CommonAlert(
            title: "Delete Item?",
            message: "This action cannot be undone.",
            primary: .destructive(Text("Delete"), action: {
                print("Item deleted!")
            }),
            secondary: .cancel()
        )
    }

    func showSimpleAlert(
        title: String = "Alert",
        message: String,
        okButtonText: String = "Cancle",
        okAction: (() -> Void)? = nil,
        showCancel: Bool = false
    ) {
        let primary = Alert.Button.default(Text(okButtonText), action: okAction)
        let secondary = showCancel ? Alert.Button.cancel() : nil

        commonAlert = CommonAlert(
            title: title,
            message: message,
            primary: primary,
            secondary: secondary
        )
    }
}



