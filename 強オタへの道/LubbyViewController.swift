//
//  LubbyViewController.swift
//  強オタへの道
//
//  Created by 中山弘瑛 on 2018/04/20.
//  Copyright © 2018年 中山弘瑛. All rights reserved.
//

import UIKit

class LubbyViewController: UIViewController {
   
    var player: Player = Player()
    
    @IBOutlet var minamiButton: UIButton!
    @IBOutlet var takashimaButton: UIButton!
    @IBOutlet var imadaButton: UIButton!
    @IBOutlet var oogamiButton: UIButton!


  

    // メンバー情報
    var member: Int!
    let userDefaults = UserDefaults.standard

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PassCodeUtil.playBGM(fileName: "Re_cybernetic_Free_BGM_ver")
    
  
        // Do any additional setup after loading the view.
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
   
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        PassCodeUtil.stopBGM()
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startLive1(){
        member = 0
        // 各メンバー情報を保存
        userDefaults.set(member, forKey: "member")
        performSegue(withIdentifier: "startLive", sender: nil)

    }

    @IBAction func startLive2(){
        member = 1
        // 各メンバー情報を保存
        userDefaults.set(member, forKey: "member")
        performSegue(withIdentifier: "startLive", sender: nil)
    }
    
    @IBAction func startLive3(){
        member = 2
        // 各メンバー情報を保存
        userDefaults.set(member, forKey: "member")
        performSegue(withIdentifier: "startLive", sender: nil)
    }
    
    @IBAction func startLive4(){
        member = 3
        // 各メンバー情報を保存
        userDefaults.set(member, forKey: "member")
        performSegue(withIdentifier: "startLive", sender: nil)
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
