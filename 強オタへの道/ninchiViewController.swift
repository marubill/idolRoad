//
//  ninchiViewController.swift
//  強オタへの道
//
//  Created by 中山弘瑛 on 2018/04/29.
//  Copyright © 2018年 中山弘瑛. All rights reserved.
//

import UIKit

class ninchiViewController: UIViewController {

    @IBOutlet var label: UILabel!
   
    @IBOutlet var ninchiImageView: UIImageView!
    var ninchiPictureArray: [UIImage]!
    
    // メンバー情報
    let userDefaults = UserDefaults.standard
    var member: Int!

    // ユーザーネーム
    let userDefaults2 = UserDefaults.standard
    var name: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ninchiPictureArray = [UIImage(named: "南菜生.png")!,
                           UIImage(named: "高嶋楓.png")!,
                           UIImage(named: "今田夢菜.png")!,
                           UIImage(named: "大上陽奈子.png")!,
        ]
        
        member = userDefaults.object(forKey: "member") as! Int
        
        readData()
        
        
        switch member {
        case 0:
            ninchiImageView.image = ninchiPictureArray[0]
        case 1:
            ninchiImageView.image = ninchiPictureArray[1]
        case 2:
            ninchiImageView.image = ninchiPictureArray[2]
        case 3:
            ninchiImageView.image = ninchiPictureArray[3]
        default:
            break
        }

        // Do any additional setup after loading the view.
    }
    
    // Keyを指定して読み込み
    func readData() {
        let str: String = userDefaults2.object(forKey: "name") as! String
        name = str
        label.text =  name + "いつも来てくれてありがとう また来てね！"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backHome(){
        performSegue(withIdentifier: "backHome", sender: nil)
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
