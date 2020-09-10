//
//  ColorPickerViewController.swift
//  PickersMenusActions
//
//  Created by Gabriel Theodoropoulos.
//

import UIKit

class ColorPickerViewController: UIViewController {

    @IBOutlet weak var colorSampleView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pickColor(_ sender: Any) {
        let picker = UIColorPickerViewController()
        picker.selectedColor = colorSampleView.backgroundColor ?? UIColor.black
        picker.supportsAlpha = false
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }

}


extension ColorPickerViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorSampleView.backgroundColor = viewController.selectedColor
    }
    
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {

    }
}
