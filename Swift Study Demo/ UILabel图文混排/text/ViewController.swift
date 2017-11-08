//
//  ViewController.swift
//  text
//
//  Created by che300 on 16/9/19.
//  Copyright © 2016年 CuiJian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 创建可变富文本
        let text = NSMutableAttributedString()
        
        // 图片附件
        let attachment = NSTextAttachment()
        attachment.image = UIImage(named: "subscription_tag")
        attachment.bounds = CGRect(x: 0, y: 0, width: 12, height: 12)
        
        // 根据图片附件创建图片文本
        let imageText = NSAttributedString(attachment: attachment)
        // 属性字符串
        let str1 = NSAttributedString(string: " 白色, 灰色, 绿色   ")
        let str2 = NSAttributedString(string: " 5-10万   ")
        
        text.append(imageText)
        text.append(str1)
        text.append(imageText)
        text.append(str2)
        text.append(imageText)
        text.append(str1)
        text.append(imageText)
        text.append(str2)
        text.append(imageText)
        text.append(str1)
        text.append(imageText)
        text.append(str2)
        text.append(imageText)
        text.append(str1)
        text.append(imageText)
        text.append(str2)
        text.append(imageText)
        text.append(str1)
        text.append(imageText)
        text.append(str2)
        text.append(imageText)
        text.append(str1)
        text.append(imageText)
        text.append(str2)
        // 给 label 赋值
        self.customLabel.attributedText = text
    }


}

