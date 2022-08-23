//
//  ViewController.swift
//  RxSwiftLearn
//
//  Created by weiza on 2022/8/23.
//

import UIKit
import RxSwift
import RxCocoa

//@objc    用oc来访问这段代码
//dynamic  开启运行时功能
class Preson: NSObject {
    @objc dynamic var name: String = ""
    var age: String = ""
}

class ViewController: UIViewController {
    
    let preson = Preson()
    
    @IBOutlet weak var customButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "RxSwift 初探"
        view.backgroundColor = .white
        
        setUpKVO()
        preson.name = "weiza"
        
        setupClick()
    }
    
    //MARK: KVO
    func setUpKVO() {
        preson.rx.observeWeakly(String.self, "name")
            .subscribe { value in
                print(value)
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: 点击事件
    func setupClick() {
        customButton.rx.tap
            .subscribe { event in
                print("custom button")
            }
            .disposed(by: disposeBag)
    }
    
}




