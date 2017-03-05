//
//  LateOnsetSort.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//

import Foundation

class LateOnsetSource:LayerSort {
    override var name:String {
        return "Late Onset Sorting, Evenly Weighted"
    }
    
    override func sort(layers:[Layer]) -> [Layer]? {
        let sorted = layers.sorted(by: { (p, q) -> Bool in
            // FIXME: i might have this reversed
            return p.onset < q.onset
        })
        return self.orderToOutside(layers: sorted)
    }
}
