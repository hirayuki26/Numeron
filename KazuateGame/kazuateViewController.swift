//
//  kazuateViewController.swift
//  KazuateGame
//
//  Created by NinseiFukaya on 2022/08/21.
//

import UIKit

class kazuateViewController: UIViewController {
    var countEAT: Int = 0
    var countBITE: Int = 0
    
    @IBOutlet var cancel:UIButton!
    
    @IBOutlet var teme: UILabel!
    
    @IBOutlet var keikoku: UILabel!
    
    @IBOutlet var in1: UILabel!
    @IBOutlet var in2: UILabel!
    @IBOutlet var in3: UILabel!
    
    @IBOutlet var n0: UIButton!
    @IBOutlet var n1: UIButton!
    @IBOutlet var n2: UIButton!
    @IBOutlet var n3: UIButton!
    @IBOutlet var n4: UIButton!
    @IBOutlet var n5: UIButton!
    @IBOutlet var n6: UIButton!
    @IBOutlet var n7: UIButton!
    @IBOutlet var n8: UIButton!
    @IBOutlet var n9: UIButton!
    
    @IBOutlet var kakutei: UIButton!
    
    @IBOutlet var EAT: UILabel!
    @IBOutlet var BITE: UILabel!
    
    
    var nantemecount: Int = 1
    
    var outNum1: Int!
    var outNum2: Int!
    var outNum3: Int!
    
    var location: Int = 0
    
    var inNum1: Int!
    var inNum2: Int!
    var inNum3: Int!
    
    var outArray = [Int]()
    //上は空配列の定義
    
    var inArray = Array(repeating: 0, count: 3)
    
    //入力を受け付ける関数
    func setNum(inArray: inout [Int] ,location: Int, num: Int) {
        inArray[location] = num
        switch location {
        case 0: in1.text = String(num)
        case 1: in2.text = String(num)
        case 2: in3.text = String(num)
        default: break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        n1.layer.cornerRadius = 15
        n2.layer.cornerRadius = 15
        n3.layer.cornerRadius = 15
        n4.layer.cornerRadius = 15
        n5.layer.cornerRadius = 15
        n6.layer.cornerRadius = 15
        n7.layer.cornerRadius = 15
        n8.layer.cornerRadius = 15
        n9.layer.cornerRadius = 15
        n0.layer.cornerRadius = 15
        cancel.layer.cornerRadius = 15
        kakutei.layer.cornerRadius = 15
        
        //下の条件を満たすまでループされる
        repeat  {
            outNum1 = Int.random(in: 0...9)
            outNum2 = Int.random(in: 0...9)
            outNum3 = Int.random(in: 0...9)
        }while outNum1 == outNum2 || outNum2 == outNum3 || outNum1 == outNum3
        
        outArray.append(outNum1)
        outArray.append(outNum2)
        outArray.append(outNum3)
        
        print(outArray)
    }
    
    @IBAction func N1() {
        setNum(inArray: &inArray, location: location, num: 1) //入力を配列に入れる
        
        location += 1 //入力位置を進める
        
        n1.disappear() //ボタン押せないように消す
    }
    
    @IBAction func N2() {
        setNum(inArray: &inArray,location: location,num: 2)
        
        location += 1
        
        n2.disappear()
    }
    
    @IBAction func N3() {
        setNum(inArray: &inArray,location: location,num: 3)
        
        location += 1
        
        n3.disappear()
    }
    
    @IBAction func N4() {
        setNum(inArray: &inArray,location: location,num: 4)
        
        location += 1
        
        n4.disappear()
    }
    
    @IBAction func N5() {
        setNum(inArray: &inArray,location: location,num: 5)
        
        location += 1
        
        n5.disappear()
    }
    
    @IBAction func N6() {
        setNum(inArray: &inArray,location: location,num: 6)
        
        location += 1
        
        n6.disappear()
    }
    
    @IBAction func N7() {
        setNum(inArray: &inArray,location: location,num: 7)
        
        location += 1
        
        n7.disappear()
    }
    
    @IBAction func N8() {
        setNum(inArray: &inArray,location: location,num: 8)
        
        location += 1
        
        n8.disappear()
    }
    
    @IBAction func N9() {
        setNum(inArray: &inArray,location: location,num: 9)
        
        location += 1
        
        n9.disappear()
    }
    
    @IBAction func N0() {
        setNum(inArray: &inArray,location: location,num: 0)
        
        location += 1
        
        n0.disappear()
    }
    
    
    @IBAction func Cancel() {
        print(inArray)
        
        switch location { //何個目の数字を入力してるかで条件分岐
        case 0: keikoku.text = "入力してください！" //今までの入力なし
        case (1...3): //今までの入力あり
            
            //一個前に入力した数字のボタンを復活させる
            switch inArray[location - 1] { //一個前の入力の数字で条件分岐
            case 0: n0.appear()
            case 1: n1.appear()
            case 2: n2.appear()
            case 3: n3.appear()
            case 4: n4.appear()
            case 5: n5.appear()
            case 6: n6.appear()
            case 7: n7.appear()
            case 8: n8.appear()
            case 9: n9.appear()
            default: break
            }
            
//            inArray.remove(at: location - 1)は箱が減る！
            //一個前の入力をリセットする
            inArray[location - 1] = 0
            
            //表示をリセットする
            switch location {
            case 1: in1.text = "-"
            case 2: in2.text = "-"
            case 3: in3.text = "-"
            default: break
            }
            
            //入力の場所を一個前に戻す
            location -= 1
        default: keikoku.text = " "
        }
        print(inArray)
        print(location)
        
    }
    
    @IBAction func Kakutei() {
        if location == 3 { //３桁の入力が済んでいる場合
            
            //eatとbiteの数を計算
            for i in 0..<3 { //０から２までループ
                
                //消えていた数字の復活
                switch inArray[i] {
                case 0: n0.appear()
                case 1: n1.appear()
                case 2: n2.appear()
                case 3: n3.appear()
                case 4: n4.appear()
                case 5: n5.appear()
                case 6: n6.appear()
                case 7: n7.appear()
                case 8: n8.appear()
                case 9: n9.appear()
                default: break
                }
                
                //数とその場所が合っている場合
                if outArray[i] == inArray[i] {
                    countEAT = countEAT + 1
                }
                
                //biteの数を計算
                for j in 0..<3 {
                    if i == j {
                        continue
                        //continueは飛ばす！
                    } else if outArray[i] == inArray[j] { //数はあっているが場所がちがう場合
                        countBITE = countBITE + 1
                        break
                        //breakでbiteがわかったら調べるのを終える
                    }
                    
                }
                
            }
            
            //eatとbiteの表示
            EAT.text = String(countEAT)
            BITE.text = String(countBITE)
            
            //クリアかどうかの表示　ここは画面遷移させてるからいらんかもね
            if countEAT == 3 {
                keikoku.text = String("クリア！")
            }else{
                keikoku.text = String("　")
            }
            
            //いろんなやつの初期化
            in1.text = "-"
            in2.text = "-"
            in3.text = "-"
            
            countEAT = 0
            countBITE = 0
            
            location = 0
            
            nantemecount += 1
            teme.text = String(nantemecount)
        } else {
            keikoku.text = String("続きを入力してください！")
        }
        
        print(inArray)
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





