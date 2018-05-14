//
//  LiveViewController.swift
//  強オタへの道
//
//  Created by 中山弘瑛 on 2018/04/20.
//  Copyright © 2018年 中山弘瑛. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {
    
    var maxStamina: Float = 100
    var minStamina: Float = 0
    var stamina: Float = 0
    var player = Player()
    
    var select: Int!
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var liveImageView: UIImageView!
    
    //ペンライト
    @IBOutlet var penLightButtonRed: UIButton!
    @IBOutlet var penLightButtonBlue: UIButton!
    @IBOutlet var penLightButtonYellow: UIButton!
    
    //color
    @IBOutlet var colorImageView: UIImageView!
    
    //color画像を保存しておく配列
    var colorArray: [String]!
    
    
    
    
    
    @IBOutlet var playerHPBar: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // 標準だとProgressBarが細いので拡大
        playerHPBar.transform = CGAffineTransform(scaleX: 1.0, y: 4.0)
        
        // スタミナを起動時に最小にする
        stamina = minStamina
        playerHPBar.progress = stamina / maxStamina
        
        //0〜2の間でランダムに数字を発生させる
        let number = Int(arc4random_uniform(2))
        
        //color画像を3枚追加する
        colorArray = ["赤.png",
                      "黄.png",
                      "青.png",]
        
      
        
        //ランダムに選んだcolor画像を表示させる
        colorImageView.image = UIImage(named:colorArray[number])
        
      
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func select0(){
        select = 0
        print("bbb")
        print(colorArray)
        playerAttack()
        
        
    }
    @IBAction func select1(){
        select = 1
        print("bbb")
        playerAttack()
        
    }
    @IBAction func select2(){
        select = 2
        print("bbb")
        playerAttack()
        
    }
    
    func playerAttack(){
        switch colorArray {
        case ["赤.png"]:
            print("aaa")
            if select == 0 {
            // HPの更新
            print("playerHP is\(player.attackPower)")
            player.currentHP = player.currentHP + player.attackPower
            playerHPBar.setProgress(player.currentHP / player.maxHP, animated: true)
            }
            
            
        case ["黄.png"]:
            
            if select == 1 {
            // HPの更新
            print("playerHP is\(player.attackPower)")
            player.currentHP = player.currentHP + player.attackPower
            playerHPBar.setProgress(player.currentHP / player.maxHP, animated: true)
            }
            
                
                
        case ["青.png"]:
            
            if select == 2 {
            // HPの更新
            print("playerHP is\(player.attackPower)")
            player.currentHP = player.currentHP + player.attackPower
            playerHPBar.setProgress(player.currentHP / player.maxHP, animated: true)
            }
            
        default:
            break
            
        }
        
        print(player.currentHP)
        
        
        if player.currentHP > 100 {
            finishLive(winPlayer: true)
    }
        
    }
        
    
        
    func finishLive(winPlayer: Bool){
            
        //攻撃ボタンを隠す
        penLightButtonRed.isHidden = true
        penLightButtonBlue.isHidden = true
        penLightButtonYellow.isHidden = true
            
        let finishedMessage: String
        if winPlayer == true {
            finishedMessage = "楽しんでくれてありがとう！認知レベルが１上がった"
        } else {
            finishedMessage = "まだまだだね..."
        }
            
        let alert = UIAlertController(title: "LIVE終了", message: finishedMessage,
                                          preferredStyle: UIAlertControllerStyle.alert)
            
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{(action: UIAlertAction!) in
            
            //アラートが消えるのと画面遷移が重ならないように0.5秒後に画面遷移するようにしてる
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // 0.5秒後に実行したい処理
                self.performSegue(withIdentifier: "takeapicture", sender: nil)
            }
        }
        )
        
        alert.addAction(action)
        
        //アラートを表示する
        present(alert, animated: true, completion: nil)

    
    }
        
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
