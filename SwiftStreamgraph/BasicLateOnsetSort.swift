//
//  BasicLateOnsetSort.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//

import Foundation

class BasicLateOnsetSort: LayerSort {
    override var name:String {
        return "Late Onset Sorting, Top to Bottom"
    }
    
    override func sort(layers:[Layer]) -> [Layer] {
        return layers.sorted { (a, b) -> Bool in
            return a.onset <= b.onset
        }
    }
}
