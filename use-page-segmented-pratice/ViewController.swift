//
//  ViewController.swift
//  use-page-segmented-pratice
//
//  Created by 郭怡玲 on 2022/7/29.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController {
    
    
    let radioNameArray:Array = ["BTS-Butter","Eric-Graduation","GenHoshino-Comedy","NAYEON-POP","髭男-MixedNuts"]
    let radioPic:Array = ["BTS.jpeg","Eric.jpeg","GenHoshino.jpeg","NAYEON.jpeg","OfficialHIGEDANdism.jpeg"]

    var nowIndex:Int = 0

    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var segmentIdx: UISegmentedControl!
    @IBOutlet weak var pagesIdx: UIPageControl!
    @IBOutlet weak var imagesViewShow: UIImageView!
    @IBOutlet weak var radioNameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagesViewShow.image = UIImage(named: radioPic[nowIndex])
        radioNameLabel.text = radioNameArray[nowIndex]
        

        let time = Date()
        let date = Calendar.current.dateComponents(in: TimeZone.current, from: time)
        let month = date.month!
        let day = date.day!
        
        dateLabel.text = "今天是\(month)月\(day)號"
    }
    
    func changeContent(idx:Int){
        nowIndex = idx
        
        imagesViewShow.image = UIImage(named: radioPic[nowIndex])
        radioNameLabel.text = radioNameArray[nowIndex]
        
        segmentIdx.selectedSegmentIndex = nowIndex
        pagesIdx.currentPage = nowIndex
        countLabel.text = "\(nowIndex + 1) / \(radioNameArray.count)"
        
    }
    func prevIdx (){
        if nowIndex > 0 {
            nowIndex -= 1
        }else {
            nowIndex = radioNameArray.count - 1
        }
        changeContent(idx:nowIndex)
    }
    func nextIdx (){
        if nowIndex < radioNameArray.count - 1{
            nowIndex += 1
        }else{
            nowIndex = 0
        }
        changeContent(idx:nowIndex)
    }
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
       
        changeContent(idx: sender.selectedSegmentIndex)
    }
    
    @IBAction func pagesChange(_ sender: UIPageControl) {
       
        changeContent(idx: sender.currentPage)
    }
    
    @IBAction func prevChange(_ sender: Any) {
        prevIdx()
    }
    
    
    @IBAction func nextChange(_ sender: Any) {
        nextIdx()
    }
    
    
    @IBAction func swipeChange(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .right{
            prevIdx()
            
        } else if sender.direction == .left{
            nextIdx()
        }
    }
    
}


