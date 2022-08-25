//
//  BaseViewController.swift
//  rxswiftLearn
//
//  Created by mac on 2022/8/25.
//

import UIKit
import RxSwift

class BaseViewController: UIViewController {

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func configUI() {}

}
