//
//  StackTraceController.swift
//  pep9pad
//
//  Created by Josh Haug on 12/18/16.
//  Copyright © 2016 Pepperdine University. All rights reserved.
//

import UIKit
import Foundation

class StackCellItem: UIView {
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        //// General Declarations
        let context = ctx
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: CGRect(x: 36, y: 0, width: 50, height: 22))
        UIColor.black.setStroke()
        rectanglePath.lineWidth = 1
        rectanglePath.stroke()
        
        //// Text Drawing
        let textRect = CGRect(x: 36, y: 0, width: 50, height: 22)
        let textTextContent = "N"
        let textStyle = NSMutableParagraphStyle()
        textStyle.alignment = .center
        let textFontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize),
            .foregroundColor: UIColor.black,
            .paragraphStyle: textStyle,
            ] as [NSAttributedStringKey: Any]
        
        let textTextHeight: CGFloat = textTextContent.boundingRect(with: CGSize(width: textRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: textFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: textRect)
        textTextContent.draw(in: CGRect(x: textRect.minX, y: textRect.minY + (textRect.height - textTextHeight) / 2, width: textRect.width, height: textTextHeight), withAttributes: textFontAttributes)
        context.restoreGState()
        
        
        //// Text 2 Drawing
        let text2Rect = CGRect(x: 0, y: 5, width: 33, height: 12)
        let text2TextContent = "0003"
        let text2Style = NSMutableParagraphStyle()
        text2Style.alignment = .right
        let text2FontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize),
            .foregroundColor: UIColor.black,
            .paragraphStyle: text2Style,
            ] as [NSAttributedStringKey: Any]
        
        let text2TextHeight: CGFloat = text2TextContent.boundingRect(with: CGSize(width: text2Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text2FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text2Rect)
        text2TextContent.draw(in: CGRect(x: text2Rect.minX, y: text2Rect.minY + (text2Rect.height - text2TextHeight) / 2, width: text2Rect.width, height: text2TextHeight), withAttributes: text2FontAttributes)
        context.restoreGState()
        
        
        //// Text 3 Drawing
        let text3Rect = CGRect(x: 89, y: 5, width: 33, height: 12)
        let text3TextContent = "ch"
        let text3Style = NSMutableParagraphStyle()
        text3Style.alignment = .left
        let text3FontAttributes = [
            .font: UIFont.systemFont(ofSize: UIFont.smallSystemFontSize),
            .foregroundColor: UIColor.black,
            .paragraphStyle: text3Style,
            ] as [NSAttributedStringKey: Any]
        
        let text3TextHeight: CGFloat = text3TextContent.boundingRect(with: CGSize(width: text3Rect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: text3FontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: text3Rect)
        text3TextContent.draw(in: CGRect(x: text3Rect.minX, y: text3Rect.minY + (text3Rect.height - text3TextHeight) / 2, width: text3Rect.width, height: text3TextHeight), withAttributes: text3FontAttributes)
        context.restoreGState()

    }
}

class StackTraceController: UIViewController {
    
    private var globalVars = NSMutableArray()
    private var runtimeStack = NSMutableArray()
    private var heap = NSMutableArray()
    private var isRuntimeStackItemAddedStack = NSMutableArray()
    private var isHeapItemAddedStack = NSMutableArray()
    private var isStackFrameAddedStack = NSMutableArray()
    private var isHeapFrameAddedStack = NSMutableArray()
    private var stackHeightToStackFrameMap = NSMutableArray()
    private var modifiedBytes = NSMutableArray()
    private var bytesWrittenLastStep = NSMutableArray()
    private var addressToGlobalItemMap = NSMutableArray()
    private var addressToStackItemMap = NSMutableArray()
    private var addressToHeapItemMap = NSMutableArray()
    private var numCellsInStackFrame = NSMutableArray()
    private var graphicItemsInStackFrame = NSMutableArray()
    private var heapFrameItemStack = NSMutableArray()
    private var newestHeapItemsList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Interface Builder

    // MARK: Attributes
    
    /* NOTE -- See memorytracepane and memorycellgraphicsitem in ../Ref,
     the logic will be the same but there is quite a bit of Qt complexity
     that will need to be ported over.  Makes sense to use bezier curves
     for rendering, particularly because they'll look good no matter the
     screen res.  Could programmatically generate the bezier curves using
     an automated tool like PaintCode.
     */
    
    // MARK: - Methods
    
    // See cellSize(Enu::ESymbolFormat symbolFormat) declaration in Sim.h.  That function is used exclusively in these classes, and should be implemented here in the iOS version.
    
    /// Post: The memory trace is populated (on assembly).
    func setMemoryTrace() {
        globalVars.removeAllObjects()
        runtimeStack.removeAllObjects()
        heap.removeAllObjects()
        isRuntimeStackItemAddedStack.removeAllObjects()
        isHeapItemAddedStack.removeAllObjects()
        isStackFrameAddedStack.removeAllObjects()
        isHeapFrameAddedStack.removeAllObjects()
        stackHeightToStackFrameMap.removeAllObjects()
        modifiedBytes.removeAllObjects()
        bytesWrittenLastStep.removeAllObjects()
        addressToGlobalItemMap.removeAllObjects()
        addressToStackItemMap.removeAllObjects()
        addressToHeapItemMap.removeAllObjects()
        numCellsInStackFrame.removeAllObjects()
        graphicItemsInStackFrame.removeAllObjects()
        heapFrameItemStack.removeAllObjects()
        newestHeapItemsList.removeAllObjects()
        // TODO: scene.clear()
        
        if maps.traceTagWarning {
            // hide view
            return
        }
        
        // stack location
        // global location
        // heap location
        
        var blockSymbol: String;
        var multiplier: Int;
        
        for i in 0..<maps.blockSymbols.count {
            blockSymbol = maps.blockSymbols[i]
            multiplier = maps.symbolFormatMultiplier[blockSymbol]!
            let address = maps.symbolTable[blockSymbol]
            
            if maps.globalStructSymbols.keys.contains(blockSymbol) {
                
            } else {
                if multiplier == 1 {
                    
                } else {
                    // Array
                }
            }
        }
        
//        blockSymbol = maps.blockSymbols[0]
//        multiplier = maps.symbolFormatMultiplier[blockSymbol]!
//        let address = maps.symbolTable[blockSymbol]!
//
//        print("blockSymbol: \(blockSymbol)")
//        print("multiplier: \(multiplier)")
//        print("address: \(address)")
    }
    
    /// Post: The memory trace is updated.
    func updateMemoryTrace() {
        
    }
    
    /// Post: Modfied bytes are cached for updating the sim view
    func cacheChanges() {
        
    }
    
    /// Post: Stack changes are cached for the next time the simulation view is updated
    func cacheStackChanges() {
        
    }
    
    /// Post: Heap changes are cached for the next time the simulation view is updated
    func cacheHeapChanges() {
        
    }
}
