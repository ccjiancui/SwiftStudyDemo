//: Playground - noun: a place where people can play

import UIKit

let msgLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 100))

var htmlText = "空は<font color=\"blue\">青い</font>。<br>An apple is <font color=\"red\">red</font>."
do {
    let attrStr = try NSAttributedString(data: htmlText.data(using: String.Encoding.unicode)!, options: [NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil)
    
    msgLabel.attributedText = attrStr
} catch let error as NSError {
    print(error.localizedDescription)
}

msgLabel
