//
//  EasySingleStringPicker.swift
//  EasyPicker
//
//  Created by Tomislav Jankovic on 28/02/2020.
//  Copyright © 2020 TomislavJankovic. All rights reserved.
//

import UIKit

public typealias CompletionHandlerPicker = (_ selectedString: String, _ selectedRow: Int) -> Void

class EasySingleStringPicker: EasyStringPicker {

    // MARK: - Properies
    private var completionBlock: CompletionHandlerPicker!

    // MARK: - Init

    public init(data: [String], completion: @escaping CompletionHandlerPicker) {
        completionBlock = completion
        super.init(data: data)
    }

    // MARK: - Data Binding

    override func returnPickerValue(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let value = dataSource[row] as? String {
            completionBlock(value, row)
        }
    }
}
