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
    var player: Player!
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var liveImageView: UIImageView!
    
    @IBOutlet var penLightButton: UIButton!
    
    @IBOutlet var playerHPBar: UIProgressView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 標準だとProgressBarが細いので拡大
        playerHPBar.transform = CGAffineTransform(scaleX: 1.0, y: 4.0)
        
        // スタミナを起動時に最小にする
        stamina = minStamina
        playerHPBar.progress = stamina / maxStamina
        

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playerAttack(){
        
        // HPの更新
        player.currentHP = player.currentHP + player.attackPower
        playerHPBar.setProgress(player.currentHP / player.maxHP, animated: true)
        
    
        
        if player.currentHP > 100 {
            finishLive(winPlayer: true)
        

    }
        
    }
        
    func finishLive(winPlayer: Bool){
            
        //攻撃ボタンを隠す
        penLightButton.isHidden = true
            
        let finishedMessage: String
        if winPlayer == true {
            finishedMessage = "楽しんでくれてありがとう！"
        } else {
            finishedMessage = "まだまだだね..."
        }
            
        let alert = UIAlertController(title: "LIVE終了", message: finishedMessage,
                                          preferredStyle: UIAlertControllerStyle.alert)
            
        let action = UIAlertAction(title: "OK", style: .default, handler: {action in self.dismiss(animated: true, completion: nil)
                
        })
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
            
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
