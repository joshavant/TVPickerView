//
//  ViewController.swift
//  TVPickerView
//
//  Created by Max Chuquimia on 21/10/2015.
//  Copyright © 2015 Chuquimian Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picker: TVPickerView!
    @IBOutlet weak var selectedView: UIView!
    @IBOutlet weak var selectedLabel: UILabel!
    @IBOutlet weak var liveView: UIView!

    fileprivate var isPickerLoaded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.focusDelegate = self
        picker.dataSource = self
        picker.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if !isPickerLoaded {
            picker.reloadData()
            isPickerLoaded = true
        }
    }
    
    let colors: [UIColor] = [
        .black,
        .darkGray,
        .lightGray,
        .gray,
        .red,
        .green,
        .blue,
        .cyan,
        .yellow,
        .magenta,
        .orange,
        .purple,
        .brown,
        .black,
        .darkGray,
        .lightGray,
        .gray,
        .red,
        .green,
        .blue,
        .cyan,
        .yellow,
        .magenta,
        .orange,
        .purple,
        .brown,
        .black,
        .darkGray,
        .lightGray,
        .gray,
        .red,
        .green,
        .blue,
        .cyan,
        .yellow,
        .magenta,
        .orange,
        .purple,
        .brown,
        .black,
        .darkGray,
        .lightGray,
        .gray,
        .red,
        .green,
        .blue,
        .cyan,
        .yellow,
        .magenta,
        .orange,
        .purple,
        .brown,
    ]
}

extension ViewController {
 
    
    @IBAction func topButtonTapped(_ sender: AnyObject) {
        print("This button is here so that the picker is not in focus by default #justdemothings")
    }
    
    @IBAction func firstButtonTapped(_ sender: AnyObject) {
        picker.scrollToIndex(0)
    }
    
    @IBAction func midButtonTapped(_ sender: AnyObject) {
        picker.scrollToIndex(colors.count / 2)
    }
    
    @IBAction func lastButtonTapped(_ sender: AnyObject) {
        picker.scrollToIndex(colors.count - 1)
    }
}

extension ViewController: TVPickerViewFocusDelegate {
    
    func pickerView(_ picker: TVPickerView, deepFocusStateChanged isDeepFocus: Bool) {

        if !isDeepFocus {
            selectedLabel.text = "User exited picker at index:\n\(picker.selectedIndex)"
            selectedView.backgroundColor = colors[picker.selectedIndex]
        }
    }
}

extension ViewController: TVPickerViewDataSource {
   
    func numberOfViewsInPickerView(_ picker: TVPickerView) -> Int {
        return colors.count
    }
    
    func pickerView(_ picker: TVPickerView, viewForIndex idx: Int, reusingView view: UIView?) -> UIView {
        
        var sview = view as? UILabel
        
        if sview == nil {
            sview = UILabel()
            sview!.textColor = .white
            sview!.font = .systemFont(ofSize: 30)
            sview!.textAlignment = .center
        }
        
        sview!.backgroundColor = colors[idx]
        sview!.text = " \(idx)"
        
        return sview!
    }
}

extension ViewController: TVPickerViewDelegate {
    func pickerView(_ picker: TVPickerView, didChangeToIndex index: Int) {
        liveView.backgroundColor = colors[index]
    }
}
