//
//  CodeView.swift
//  pep9pad
//
//  Copyright © 2016 Pepperdine University. All rights reserved.

import UIKit

class CodeView: UIView, UITextViewDelegate {
    
    internal var textStorage: PepTextStorage!
    internal var layoutManager: NSLayoutManager!
    internal var textContainer: NSTextContainer!
    internal var textView: UITextView!
    internal var delegate: CodeViewDelegate!
    
    // MARK: - Initializers and Set-up Functions
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupTextView(_ frame: CGRect) {
        let rect = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.width, height: frame.height)
        self.textStorage = PepTextStorage()
        self.layoutManager = NSLayoutManager()
        self.textStorage.addLayoutManager(layoutManager)
        self.textContainer = NSTextContainer()
        self.layoutManager.addTextContainer(textContainer)
        self.textView = UITextView(frame: rect, textContainer: textContainer)
        textView.autocorrectionType = .no
        textView.isScrollEnabled = false
        self.addSubview(textView)
        textView.showsVerticalScrollIndicator = true
        textView.isScrollEnabled = true
        textView.delegate = self
//        self.font = UIFont(name: Courier, size: 16)
//        self.directionalLockEnabled = true
//        self.textAlignment = .Left
    }
    
    func setupTextView(_ frame: CGRect, delegate: CodeViewDelegate) {
        self.delegate = delegate
        setupTextView(frame)
    }
    
    func setEditable(_ to: Bool) {
        textView.isEditable = to
    }
    
    

    // MARK: - Text-Handling Functions
    
    internal func setText(_ to: String) {
        self.textView.text = to
    }
    
    
    func removeAllText() {
        textView.text.removeAll()
    }
    
    
    func getText() -> String {
        return textView.text
    }
    
    
    func loadExample(_ fileName: String, ofType: PepFileType) {
        guard let path = Bundle.main.path(forResource: fileName, ofType: ofType.rawValue) else {
            print("Could not load file named \(fileName).\(ofType.rawValue)")
            return
        }
        
        do {
            let content = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
            print("Loaded file named \(fileName).\(ofType.rawValue)")
            self.textView.text.removeAll()
            self.textView.insertText(content)
        } catch _ as NSError {
            print("Could not load file named \(fileName).\(ofType.rawValue)")
            return
        }
    }
    

    // MARK: - Conformance to UITextViewDelegate
    
    func textViewDidChange(_ textView: UITextView) {
        if delegate != nil {
            delegate.textViewDidChange()
        }
    }

    
    
    
    
    
}