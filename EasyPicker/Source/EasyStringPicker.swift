//
//  EasyStringPicker.swift
//  EasyPicker
//
//  Created by Tomislav Jankovic on 27/02/2020.
//  Copyright © 2020 TomislavJankovic. All rights reserved.
//

import UIKit

internal class EasyStringPicker: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {

    // MARK: - Properies
    var pickerView: UIPickerView!
    var dataSource: [Any]!
    var rowHeight: CGFloat?
    var padding: CGFloat?
    var font: UIFont?
    var textColor: UIColor?

    // MARK: - Init

    init(data: [AnyObject]) {
        super.init()
        dataSource = data
        pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.reloadAllComponents()
    }

    // MARK: - UIPickerViewDelegate

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if let data = dataSource as? [[String]] {
            return data.count
        }
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let data = dataSource[component] as? [String] {
            return data.count
        }
        return dataSource.count
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return rowHeight ?? 20
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        var label = view as? UILabel
        if label == nil {
            let updatedPadding = padding ?? 8
            label = UILabel(frame: CGRect(x: updatedPadding,
                                          y: 0.0,
                                          width: pickerView.rowSize(forComponent: component).width - (updatedPadding * 2),
                                          height: pickerView.rowSize(forComponent: component).height))
        }

        if font != nil {
            label?.font = font
        }
        if textColor != nil {
            label?.textColor = textColor
        }

        label?.textAlignment = .center
        label?.adjustsFontSizeToFitWidth = true
        label?.adjustsFontForContentSizeCategory = true
        label?.minimumScaleFactor = 0.5

        if let data = dataSource[component] as? [String] {
            label?.text = data[row]
        } else {
            label?.text = dataSource[row] as? String
        }

        return label ?? UILabel()
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        returnPickerValue(pickerView: pickerView, didSelectRow: row, inComponent: component)
    }

    func returnPickerValue(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {}
}
