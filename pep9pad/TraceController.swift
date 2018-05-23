//
//  TraceController.swift
//  pep9pad
//
//  Copyright © 2016 Pepperdine University. All rights reserved.
//

import UIKit

class TraceController: UIViewController {
    var traceTable: ListingTraceController!
    var stackTrace: StackTraceController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            switch id {
            case "embedListingTrace":
                traceTable = segue.destination as! ListingTraceController
            case "embedStackTrace":
                stackTrace = segue.destination as! StackTraceController
            default:
                break

            }
        }
    }
}
