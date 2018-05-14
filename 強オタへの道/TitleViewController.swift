//
//  TitleViewController.swift
//  強オタへの道
//
//  Created by 中山弘瑛 on 2018/05/13.
//  Copyright © 2018年 中山弘瑛. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var selectButton: UIButton!
    
    // ユーザーネーム
    @IBOutlet var textField:UITextField!
    let userDefaults2 = UserDefaults.standard
    var name: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textField の情報を受け取るための delegate を設定
        textField.delegate = self
        // デフォルト値
        userDefaults2.register(defaults: ["DataStore": "default"])
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        name = textField.text!
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        saveData(str: name)
        
        return true
    }
    
    func saveData(str: String){
        
        // Keyを指定して保存
        userDefaults2.set(str, forKey: "name")
        userDefaults2.synchronize()
        
        
    }
    
    @IBAction func select(){

        performSegue(withIdentifier: "select", sender: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
