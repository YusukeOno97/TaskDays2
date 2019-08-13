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
    var randomNum: Int = Int.random(in: 0 ... 100)
    
    // ボタンを押して答えた回数
    var count: Int = 0
    
    
    // テキストビューの表示紐付け
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
        
        
        
        
        // 正解した後リスタートする関数
        func restart(){
            // カウントを初めからにする
            count = 0
            //  数字をシャッフル
            randomNum = Int.random(in: 1 ... 100)
            // 入力された数値を表示するラベルをリスタートする
            DisplayNum.text = "??"
            
        }
        
        // Int型の数値が使われた場合
        if let numA = Int(TextIn.text!) {
            count += 1
            
            // 入力欄を空にする
            TextIn.text = ""
            // 入力された値が0か100以上のとき
            if numA == 0 || numA > 100{
                showlAlert(message: "「１~100の数字を入れてください」")
                // 答えが入力された値より大きい場合
            } else if numA < randomNum {
                
                // アラート
                showlAlert(message:"答えは\(numA)より大きい値です")
                
                //入力履歴と改行
                DisplayHis.text += ("[\(count)回目] 答えは\(numA)より大きい値です\n")
                
                // 入力された数字を表示するラベル
                DisplayNum.text = "\(numA)"
                
                
                
                // 答えが入力された値より小さい場合
            } else if numA > randomNum {
                // アラート
                showlAlert(message: "答えは\(numA)より小さい値です")
                
                //入力履歴と改行
                DisplayHis.text += ("[\(count)回目] 答えは\(numA)より小さい値です\n")
                
                // 入力された数字を表示するラベル
                DisplayNum.text = "\(numA)"
                
                
                //答えが入力された値と一致する場合
            } else if numA == randomNum {
                // アラート
                showlAlert(message: "\(count)回目で正解しました。\n数字をリセットしました。")
                //入力履歴と改行
                DisplayHis.text += ("[正解] 答えは\(randomNum)でした。\n")
                // 入力欄を記入された数値にする
                DisplayNum.text = "\(numA)"
                // 入力欄を空にする
                DisplayNum.text = ""
                // 数値をリスタートする
                restart()
            }
            
            
            
            
            
            
            return
        }
        
        //Int型以外の型を入れたとき
        if String?(TextIn.text!) != nil{
            // アラートの表示
            showlAlert(message: "「１~100の数字を入れてください」")
            
            // 入力欄を空にする
            TextIn.text = ""
            
        }
        
        
        
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
    }
    
    
}









