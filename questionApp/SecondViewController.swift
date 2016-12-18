

import UIKit

class SecondViewController: UIViewController {
    
    //各紐付け
    @IBOutlet weak var questonNumber: UILabel!
    @IBOutlet weak var rightOrWrongText: UILabel!
    
    @IBOutlet weak var questionText: UITextView!
    
    @IBAction func answerYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
        
    }
    
    @IBAction func answerNoButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    
    //表示中の問題番号を格納
    var currentQuestionNumber:Int = 0
    
    
    //Dictionary型で質問を格納しておく
    let questions: [[String:Any]] = [
        [
            "question": "今日は晴れます",
            "answer":false
        ],
        [
            "question": "各ファイルを選ぶのはナビゲーターエリアである",
            "answer": true
        ],
        [
            "question": "ビューの背景を変えるコードはview.colorである",
            "answer": false
        ],
        [
            "question": "紐付けをしたい時はユーティティエリアの上のアシスタントエディタボタンを押す",
            "answer":true
        ],
        [
            "question": "ボタンをコード内に紐付けしたい場合、ボタンを選択した状態でshiftボタンを押しながらコード部分まで引っ張ってくる",
            "answer":false],
        [
            "question":"新しいビューの作成の仕方と、storyboardのビューとコードの紐付けの仕方を私は覚えている",
            "answer":true
        ]
    ]
    
    //質問を表示する関数
    func showQuestion(){
        
        //questionsという定数に辞書の中から０番目の問題＋答えをとる
        var question = self.questions[currentQuestionNumber]
        
        //グローバル変数に１を足す
        let number: Int = currentQuestionNumber + 1
        
        //ラベルに問題番号を表示する
        questonNumber.text = "問題番号：" + String(number)
        
        //辞書から質問部分だけを取りラベルに表示する
        if let que = question["question"] as? String{
            questionText.text = que
        }
        
    }
    
    //回答をチェックする関数。
    //正解なら次の問題を表示
    func checkAnswer(yourAnswer:Bool) {
        
        //何も入ってない場合デバックエリアに表示する
        if yourAnswer {
        //print("回答ができていません")
            //return
        }
    
        //関数内なので同じ箱でも定義できる
        let question = questions[currentQuestionNumber]
    
        //正誤の部分をans定義して
        if let ans = question["answer"] as? Bool{
        
            //答えが合っていたら
            if yourAnswer == ans{
                //テキストに正解と表示され
                rightOrWrongText.text = "正解！"
                //問題番号が１上がる
                currentQuestionNumber+=1
                }
            else{
                //間違いの場合は不正解と表示
                rightOrWrongText.text = "不正解！"
                
                }
        
        }
        
        else{
            //print("問題の答えが入ってません")
        }
        
        // currentQuestionNumの値が問題数以上だったら最初の問題に戻す
        if currentQuestionNumber >= questions.count {
            currentQuestionNumber = 0
        }

        
        showQuestion()
    
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //出力時にshowquestion関数を表示する
        showQuestion()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
}
