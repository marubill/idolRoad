//
//  CameraViewController.swift
//  強オタへの道
//
//  Created by 中山弘瑛 on 2018/04/20.
//  Copyright © 2018年 中山弘瑛. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    
    var level:[Int] = [0,0,0,0]
    @IBOutlet var label: UILabel!
    @IBOutlet var cameraButton: UIButton!
    
    // メンバー情報
    var member: Int!
    let userDefaults = UserDefaults.standard
    
    // レベル情報
    let userDefaults1 = UserDefaults.standard
    
    // メンバーのチェキ画像
    @IBOutlet var pscImageView: UIImageView!
    var pscPictureArray: [UIImage]!
    
    
    override func viewWillAppear(_ animated: Bool) {
        pscPictureArray = [UIImage(named: "やちい.png")!,
                              UIImage(named: "かっぴ.png")!,
                              UIImage(named: "ちーゆな.png")!,
                              UIImage(named: "ひなちゃん.png")!,
                            ]
        
        //as!でどんな型かを宣言
        //userDefaults1が一回目からなのでif文でしっかり呼び出す時を明記する
        if (userDefaults1.array(forKey: "level") != nil) {
            level = userDefaults1.object(forKey: "level") as! [Int]
        }
        
        member = userDefaults.object(forKey: "member") as! Int
        
        
        //レベルアップ
        switch member {
        case 0:
            pscImageView.image = pscPictureArray[0]
            level[0] += 1
            if level[0] >= 6 {
                level[0] = 1
                label.text = "認知レベル" + String(level[0])
                userDefaults1.set(level, forKey: "level")
            }else{
            label.text = "認知レベル" + String(level[0])
            userDefaults1.set(level, forKey: "level")
            }
        case 1:
            pscImageView.image = pscPictureArray[1]
            level[1] += 1
            if level[1] >= 6 {
                level[1] = 1
                label.text = "認知レベル" + String(level[1])
                userDefaults1.set(level, forKey: "level")
            }else{
            label.text = "認知レベル" + String(level[1])
            userDefaults1.set(level, forKey: "level")
            }
        case 2:
            pscImageView.image = pscPictureArray[2]
            level[2] += 1
            if level[2] >= 6 {
                level[2] = 1
                label.text = "認知レベル" + String(level[2])
                userDefaults1.set(level, forKey: "level")
            }else{
            label.text = "認知レベル" + String(level[2])
            userDefaults1.set(level, forKey: "level")
            }
        case 3:
            pscImageView.image = pscPictureArray[3]
            level[3] += 1
            if level[3] >= 6 {
                level[3] = 1
                label.text = "認知レベル" + String(level[3])
                userDefaults1.set(level, forKey: "level")
            }else{
            label.text = "認知レベル" + String(level[3])
            userDefaults1.set(level, forKey: "level")
            }
        default:
            break
        
        }
     
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modoru(){
        if level[member] == 5{
            performSegue(withIdentifier: "ninchifinish", sender: nil)
            
        }else if level[member] <= 4{
            performSegue(withIdentifier: "modoru", sender: nil)
            
        }
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
