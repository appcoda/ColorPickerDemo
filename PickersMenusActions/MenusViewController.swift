//
//  MenusViewController.swift
//  PickersMenusActions
//
//  Created by Gabriel Theodoropoulos.
//

import UIKit

class MenusViewController: UIViewController {

    @IBOutlet weak var actionItem: UIBarButtonItem!
    
    @IBOutlet weak var tapMeButton: UIButton!
    
    @IBOutlet weak var deferredMenuButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // tapMeButton.isHidden = true
        // deferredMenuButton.isHidden = true
        
        configureActionItemMenu()
        configureTapMeButtonMenu()
        configureDeferredMenu()
    }

    
    func configureActionItemMenu() {
        let add = UIAction(title: "Add new...", image: UIImage(systemName: "plus.circle")) { (action) in
            print("Add new action was selected")
        }
        let edit = UIAction(title: "Edit", image: UIImage(systemName: "pencil.circle")) { (action) in
            print("Edit action was selected")
        }
        let delete = UIAction(title: "Delete", image: UIImage(systemName: "minus.circle"), attributes: .destructive) { (action) in
            print("Delete action was selected")
        }
        
        
        let menu = UIMenu(title: "Actions", children: [add, edit, delete])
        
        actionItem.menu = menu
    }
    
    
    func configureTapMeButtonMenu() {
        let option1 = UIAction(title: "Option 1") { (action) in
            print("Option 1 was selected")
        }
        let option2 = UIAction(title: "Option 2") { (action) in
            print("Option 2 was selected")
        }
        let option3 = UIAction(title: "Option 3") { (action) in
            print("Option 3 was selected")
        }

        let menu = UIMenu(title: "Your options...", children: [option1, option2, option3])
        tapMeButton.showsMenuAsPrimaryAction = true
        tapMeButton.menu = menu
    }
    
    
    func configureDeferredMenu() {
        let deferredMenuElement = UIDeferredMenuElement { (menuElements) in
            let asyncOption1 = UIAction(title: "Async Option 1") { (action) in
                print("Async option 1 was selected")
            }
            let asyncOption2 = UIAction(title: "Async Option 2") { (action) in
                print("Async option 2 was selected")
            }

            let deferredMenu = UIMenu(title: "Additional options...", options: .displayInline, children: [asyncOption2, asyncOption1])
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                menuElements([deferredMenu])
            }
        }
        
        let menu = UIMenu(title: "Your options...", children: [deferredMenuElement])
        deferredMenuButton.menu = menu
        deferredMenuButton.showsMenuAsPrimaryAction = true
    }
    
    
    
    
    
    @IBAction func handleActionItemTap(_ sender: Any) {
        let alert = UIAlertController(title: "Hello there!", message: "You just tapped on the bar button item!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func handleTapMeButtonTap(_ sender: Any) {
        let alert = UIAlertController(title: "Hello there!", message: "You just tapped on the Tap Me button!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
