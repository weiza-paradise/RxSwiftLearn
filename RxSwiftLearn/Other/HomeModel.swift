//
//  RootModel.swift
//  rxswiftLearn
//
//  Created by mac on 2022/8/25.
//

import Foundation

struct ClassInfo {
    var name           = ""
    var `class` : AnyClass
    var link           = ""
    var isStoryboard   = false
    var storyboardId   = ""
    var storyboardName = ""
}

let storyboardName = "Main"

struct HomeViewModel {
        
    let homeListData : [ClassInfo] = [
        ClassInfo(name: "RxSwift 初探", class: ViewController.self, isStoryboard: true, storyboardId: "rxViewController", storyboardName: storyboardName),
        ClassInfo(name: "RxSwift 核心逻辑", class: ViewController.self, isStoryboard: true, storyboardId: "rxViewController", storyboardName: storyboardName),
    ]
    
}
