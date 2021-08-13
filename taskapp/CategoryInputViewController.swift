//
//  CategoryInputViewController.swift
//  taskapp
//
//  Created by オフショア　テスト用 on 2021/08/13.
//

import UIKit
import RealmSwift
import UserNotifications

class CategoryInputViewController: UIViewController {

    @IBOutlet weak var CateroryText: UITextField!
    @IBOutlet weak var lll: UILabel!
    
    let realm = try! Realm()
    var category: Category!   // 追加する
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        CateroryText.text = category.name
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if self.CateroryText.text! != "" {
            try! realm.write {
                self.category.name = self.CateroryText.text!
                self.realm.add(self.category, update: .modified)
            }
        }
        
        super.viewWillDisappear(animated)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
