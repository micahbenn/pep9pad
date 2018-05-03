//
//  TraceController.swift
//  pep9pad
//
//  Copyright © 2016 Pepperdine University. All rights reserved.
//

import UIKit

class TraceController: UIViewController {
    var traceTable: ListingTraceController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            switch id {
            case "embedListingTrace":
                traceTable = segue.destination as! ListingTraceController
            default:
                break

            }
        }
    }
}
