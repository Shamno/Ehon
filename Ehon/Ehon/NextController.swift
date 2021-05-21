//
//  NextController.swift
//  Ehon
//
//  Created by okeiosdeveloper on 2021/05/13.
//

import UIKit
import HNToaster

class NextController: UIViewController {
    @IBOutlet weak var Textzone: UILabel! //テキスト
    @IBOutlet weak var Images: UIImageView! //画像
    @IBOutlet weak var PageNum: UILabel! //ページ番号
    
    @IBOutlet var gamen: UIView!
    
    let directionList:[UISwipeGestureRecognizer.Direction]=[.right, .left] //左右のみフリップ実装
    let image=["kyabetu","ninzin","ringo","logo2","haikei"]
    let sentence=["昔々、あるところに、おじいさんとおばあさんが住んでいました。\nある日のこと\nおばあさんは川へ洗濯に、おじいさんは山へ芝刈りに行きました。","おばあさんが川で洗濯をしていると、川上から大きな桃がどんぶらこどんぶらこと流れてきました。","おばあさんがその桃を家に持ち帰り、食べようと切ったその時、中から男の子が出てきました。","おじいさんとおばあさんは、桃から生まれた男の子の名前を「桃太郎」と名づけ、大切に育てました。","大きくなった桃太郎はある日、おじいさんとおばあさんに「鬼ヶ島へ鬼退治に行きたい」と言いました。"]
    var changeNo=0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Textzone.text=sentence[0]
        
        for direction in directionList{
            let swipeRecognizer=UISwipeGestureRecognizer(target:self , action:#selector(swipe(sender:)))
        swipeRecognizer.direction=direction
        Textzone.addGestureRecognizer(swipeRecognizer)
        Images.addGestureRecognizer(swipeRecognizer)
        PageNum.addGestureRecognizer(swipeRecognizer)
            Textzone.isUserInteractionEnabled = true
        }
        
        
    }
    @IBAction func forward(_ sender: UIButton) {
        susumu()
    }
    
    @IBAction func Back(_ sender: UIButton) {
        modoru()
    }
    
    func ChangeScene(){ //画面更新
        let name = image[changeNo]
        
        Images.image=UIImage(named:name)
        Textzone.text=sentence[changeNo]
        PageNum.text=String(changeNo+1)
    }
    
    @objc func swipe(sender:UISwipeGestureRecognizer){
        switch(sender.direction){
        case UISwipeGestureRecognizer.Direction.right:
            susumu()
        default:
            modoru()
        }
    }
    
    func susumu(){ //一ページ進む
        if(image.count-1 > changeNo){
            changeNo=changeNo+1
            ChangeScene()
        }
        else{
            Toaster.toast(onView:self.view,message:"最後のページです。")
        }
    }
    
    func modoru(){ //一ページ戻る
        if(changeNo != 0){
            changeNo=changeNo-1
            ChangeScene()
        }
        else{
            Toaster.toast(onView:self.view,message:"最初のページです。")
        }
    }
}

