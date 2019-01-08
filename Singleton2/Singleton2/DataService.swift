//
//  DataService.swift
//  Singleton2
//
//  Created by duycuong on 11/5/18.
//  Copyright © 2018 duycuong. All rights reserved.
//

import UIKit

class DataService {
    static let shared: DataService = DataService()
    
    // Computed properties
    private var _numbers: [Int]?
    var numbers: [Int] {
        get {
            if _numbers == nil {
                loadSample()
            }
            return _numbers ?? []
        }
        set {
            _numbers = newValue
        }
    }
    private func loadSample() {
        _numbers = []
        for i in 1...10 {
            _numbers?.append(i)
        }
    }
    func editNumber(at index: IndexPath, with number: Int) {
        _numbers![index.row] = number
    }
    func addNumber(with number: Int) {
        _numbers?.append(number)
    }
    func deleteNumber(at index: IndexPath) {
        _numbers?.remove(at: index.row)
    }
}
