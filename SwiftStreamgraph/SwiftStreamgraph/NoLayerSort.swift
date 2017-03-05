//
//  NoLayerSort.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//

import Foundation

class NoLayerSort:LayerSort {
    override var name:String {
        return "No Sorting"
    }
    
    override func sort(layers:[Layer]) -> [Layer] {
        return layers
    }
}
