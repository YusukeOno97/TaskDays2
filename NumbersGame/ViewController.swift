//
//  ViewController.swift
//  NumbersGame
//
//  Created by 小野勇輔 on 2019/08/06.
//  Copyright © 2019 yo-project. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // ランダムな数を生成
    var random = Int.random(in: 0 ... 100)
    
    // 現在の問題の管理
    var count: Int = 0
    // 表示でラベル紐付け
    @IBOutlet weak var DisplayNum: UILabel!
    // テキスト入力紐付け
    @IBOutlet weak var TextIn: UITextField!
    // 入力履歴紐付け
    @IBOutlet weak var DisplayHis: UITextView!
    
    // 決定ボタン紐付け
    @IBAction func TappedButton(_ sender: Any) {
        // アラートを表示する関数
        func showlAlert(message: String){
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let close = UIAlertAction(title:"OK", style: .cancel, handler: nil)
            alert.addAction(close)
            present(alert, animated: true, completion: nil)
        }
        
        // 答え
        let answer: Int = random
        
       
        // Int型の数値が使われたとき
        
        if let numA = Int(TextIn.text!) {
            count += 1
            // 入力された値が0か100以上のとき
            if numA == 0 || numA > 100{
            showlAlert(message: "「１~100の数字を入れてください」")
                
              // 答えが入力された値より大きい場合
            } else if numA < answer {
                showlAlert(message:"答えは\(numA)より大きい値です")
              // 答えが入力された値より小さい場合
            } else if numA > answer {
                showlAlert(message: "答えは\(numA)より小さい値です")
              //答えが入力された値と一致する場合
            } else if numA == answer{
                showlAlert(message: "正解です")
            }
            
            return
        }
        
        //Int型以外の型を入れたとき（絵文字対応）
        if String?(TextIn.text!) != nil{
            showlAlert(message: "「１~100の数字を入れてください」")
        }
        
        
        
        
        
        
    
        
    }
   
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
    }
    
    
}









