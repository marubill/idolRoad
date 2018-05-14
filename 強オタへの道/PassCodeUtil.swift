//
//  PassCodeUtil.swift
//  強オタへの道
//
//  Created by 中山弘瑛 on 2018/05/13.
//  Copyright © 2018年 中山弘瑛. All rights reserved.
//

import UIKit
import AVFoundation

class PassCodeUtil {
    
    static var bgmPlayer: AVAudioPlayer?
    
    //MARK: Sound Effects
    
    static func playBGM(fileName: String) {
        if let soundFilePath = Bundle.main.path(forResource: fileName, ofType: "mp3") {
            if let audiPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFilePath), fileTypeHint: nil) {
                audiPlayer.numberOfLoops = -1
                audiPlayer.prepareToPlay()
                bgmPlayer = audiPlayer
            }
        }
        bgmPlayer?.play()
    }
    
    static func stopBGM() {
        bgmPlayer?.stop()
    }
}
