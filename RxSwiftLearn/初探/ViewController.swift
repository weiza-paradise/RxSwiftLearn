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

class ViewController: BaseViewController {
    
    let preson = Preson()
    
    @IBOutlet weak var customButton: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "RxSwift 初探"
        view.backgroundColor = .white
        setUpKVO()
        preson.name = "weiza"
        
        setupClick()
        setupTextField()
        //setupTimer()
        setupNotification()
        setupGestureRecognizer()
        setupScrollerView()
        setupTextView()
    }
    
    //MARK: KVO
    func setUpKVO() {
        preson.rx.observeWeakly(String.self, "name")
            .subscribe { value in
                print(value)
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: 通知
    func setupNotification() {
        //键盘弹出通知
        NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
            .subscribe { notif in
                print(notif)
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: timer
    func setupTimer() {
        //定义一个定时器.
        let timer = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
        timer.subscribe { num in
            print(num)
        }
        .disposed(by: disposeBag)
    }
    
    //MARK: 手势
    func setupGestureRecognizer() {
        let tap = UITapGestureRecognizer()
        self.label.addGestureRecognizer(tap)
        self.label.isUserInteractionEnabled = true
        tap.rx.event.subscribe { tap in
            print(tap.view!)
        }
        .disposed(by: disposeBag)
    }
    
    //MARK: network
    func setupNetwork() {
        
    }
    
    //MARK: uibutton点击事件
    func setupClick() {
        //touchUpInside
        customButton.rx.tap
            .subscribe { event in
                print("custom button")
            }
            .disposed(by: disposeBag)
        
        //other
        customButton.rx.controlEvent( .touchCancel)
            .subscribe { event in
                
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: TextField
    func setupTextField() {
        textfield.rx.text.orEmpty.changed
            .subscribe { text in
                print(text)
            }
            .disposed(by: disposeBag)
        
        //输入值,改变label的text
        textfield.rx.text
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
        //输入值,改变btn的title
        textfield.rx.text
            .bind(to: customButton.rx.title())
            .disposed(by: disposeBag)
    }
    
    //MARK: ScrollerView
    func setupScrollerView() {
        scrollView.rx.contentOffset
            .subscribe { [weak self]content in
                self?.view.backgroundColor = UIColor.init(red: content.y/255*0.8, green: content.y/255*0.6, blue: content.y/255*0.3, alpha: 1)
            }
            .disposed(by: disposeBag)
    }
    
    //MARK: TextView
    func setupTextView() {
        
        textView.rx.didBeginEditing
            .subscribe { event in
                print("开始编辑")
            }
            .disposed(by: disposeBag)
        
        textView.rx.didEndEditing
            .subscribe { event in
                print("结束编辑")
            }
            .disposed(by: disposeBag)
        
        textView.rx.didChange
            .subscribe { (event) in
                print("内容改变")
            }
            .disposed(by: disposeBag)
        
    }
    
    
}




