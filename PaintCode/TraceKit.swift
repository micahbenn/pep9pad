//
//  TraceKit.swift
//  ProjectName
//
//  Created by AuthorName on 3/13/17.
//  Copyright © 2017 CompanyName. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//



import UIKit

public class TraceKit : NSObject {

    //// Drawing Methods

    public dynamic class func drawCanvas2(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 768, height: 1024), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 768, height: 1024), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 768, y: resizedFrame.height / 1024)


        //// Color Declarations
        let black = UIColor(red: 0.000, green: 0.000, blue: 0.000, alpha: 1.000)

        //// rect Drawing
        let rectPath = UIBezierPath(rect: CGRect(x: 162.5, y: 925.5, width: 74, height: 23))
        UIColor.black.setStroke()
        rectPath.lineWidth = 2
        rectPath.stroke()


        //// stage Drawing
        let stagePath = UIBezierPath()
        stagePath.move(to: CGPoint(x: 139, y: 949.5))
        stagePath.addLine(to: CGPoint(x: 260.5, y: 949.5))
        stagePath.move(to: CGPoint(x: 154.5, y: 949.5))
        stagePath.addLine(to: CGPoint(x: 139.5, y: 964.5))
        stagePath.move(to: CGPoint(x: 169.5, y: 949.5))
        stagePath.addLine(to: CGPoint(x: 154.5, y: 964.5))
        stagePath.move(to: CGPoint(x: 184.5, y: 949.5))
        stagePath.addLine(to: CGPoint(x: 169.5, y: 964.5))
        stagePath.move(to: CGPoint(x: 214.5, y: 949.5))
        stagePath.addLine(to: CGPoint(x: 199.5, y: 964.5))
        stagePath.move(to: CGPoint(x: 199.5, y: 949.5))
        stagePath.addLine(to: CGPoint(x: 184.5, y: 964.5))
        stagePath.move(to: CGPoint(x: 229.5, y: 949.5))
        stagePath.addLine(to: CGPoint(x: 214.5, y: 964.5))
        stagePath.move(to: CGPoint(x: 244.5, y: 949.5))
        stagePath.addLine(to: CGPoint(x: 229.5, y: 964.5))
        stagePath.move(to: CGPoint(x: 259.5, y: 949.5))
        stagePath.addLine(to: CGPoint(x: 244.5, y: 964.5))
        UIColor.black.setStroke()
        stagePath.lineWidth = 2
        stagePath.stroke()


        //// ident Drawing
        let identRect = CGRect(x: 261, y: 927, width: 54, height: 19)
        let identTextContent = "TEXT"
        let identStyle = NSMutableParagraphStyle()
        identStyle.alignment = .left
        let identFontAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: black, NSParagraphStyleAttributeName: identStyle]

        let identTextHeight: CGFloat = identTextContent.boundingRect(with: CGSize(width: identRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: identFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: identRect)
        identTextContent.draw(in: CGRect(x: identRect.minX, y: identRect.minY + (identRect.height - identTextHeight) / 2, width: identRect.width, height: identTextHeight), withAttributes: identFontAttributes)
        context.restoreGState()


        //// addr Drawing
        let addrRect = CGRect(x: 100, y: 927, width: 39, height: 19)
        let addrTextContent = "TEXT"
        let addrStyle = NSMutableParagraphStyle()
        addrStyle.alignment = .left
        let addrFontAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: black, NSParagraphStyleAttributeName: addrStyle]

        let addrTextHeight: CGFloat = addrTextContent.boundingRect(with: CGSize(width: addrRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: addrFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: addrRect)
        addrTextContent.draw(in: CGRect(x: addrRect.minX, y: addrRect.minY + (addrRect.height - addrTextHeight) / 2, width: addrRect.width, height: addrTextHeight), withAttributes: addrFontAttributes)
        context.restoreGState()


        //// data Drawing
        let dataRect = CGRect(x: 173, y: 927, width: 54, height: 19)
        let dataTextContent = "TEXT"
        let dataStyle = NSMutableParagraphStyle()
        dataStyle.alignment = .center
        let dataFontAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: black, NSParagraphStyleAttributeName: dataStyle]

        let dataTextHeight: CGFloat = dataTextContent.boundingRect(with: CGSize(width: dataRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: dataFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: dataRect)
        dataTextContent.draw(in: CGRect(x: dataRect.minX, y: dataRect.minY + (dataRect.height - dataTextHeight) / 2, width: dataRect.width, height: dataTextHeight), withAttributes: dataFontAttributes)
        context.restoreGState()


        //// globalRect Drawing
        let globalRectPath = UIBezierPath(rect: CGRect(x: 565.5, y: 925.5, width: 74, height: 23))
        UIColor.black.setStroke()
        globalRectPath.lineWidth = 2
        globalRectPath.stroke()


        //// globalData Drawing
        let globalDataRect = CGRect(x: 576, y: 927, width: 54, height: 19)
        let globalDataTextContent = "TEXT"
        let globalDataStyle = NSMutableParagraphStyle()
        globalDataStyle.alignment = .center
        let globalDataFontAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: black, NSParagraphStyleAttributeName: globalDataStyle]

        let globalDataTextHeight: CGFloat = globalDataTextContent.boundingRect(with: CGSize(width: globalDataRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: globalDataFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: globalDataRect)
        globalDataTextContent.draw(in: CGRect(x: globalDataRect.minX, y: globalDataRect.minY + (globalDataRect.height - globalDataTextHeight) / 2, width: globalDataRect.width, height: globalDataTextHeight), withAttributes: globalDataFontAttributes)
        context.restoreGState()


        //// globalAddr Drawing
        let globalAddrRect = CGRect(x: 504, y: 927, width: 39, height: 19)
        let globalAddrTextContent = "TEXT"
        let globalAddrStyle = NSMutableParagraphStyle()
        globalAddrStyle.alignment = .left
        let globalAddrFontAttributes = [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: black, NSParagraphStyleAttributeName: globalAddrStyle]

        let globalAddrTextHeight: CGFloat = globalAddrTextContent.boundingRect(with: CGSize(width: globalAddrRect.width, height: CGFloat.infinity), options: .usesLineFragmentOrigin, attributes: globalAddrFontAttributes, context: nil).height
        context.saveGState()
        context.clip(to: globalAddrRect)
        globalAddrTextContent.draw(in: CGRect(x: globalAddrRect.minX, y: globalAddrRect.minY + (globalAddrRect.height - globalAddrTextHeight) / 2, width: globalAddrRect.width, height: globalAddrTextHeight), withAttributes: globalAddrFontAttributes)
        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(TraceKitResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}