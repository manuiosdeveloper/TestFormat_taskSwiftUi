//
//  BatchViewModel.swift
//  TestFormat_taskSwiftUi
//
//  Created by Vemuluri Manoj on 06/04/25.
//

import Foundation

import SwiftUI

class BatchViewModel: ObservableObject {
    @Published var batchCount: Int {
        didSet {
            UserDefaults.standard.set(batchCount, forKey: "batchCount")
        }
    }

    init() {
        self.batchCount = UserDefaults.standard.integer(forKey: "batchCount")
    }

    func increment() {
        batchCount += 1
    }

    func reset() {
        batchCount = 0
    }
}
