//
//  LayerLayout.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//

import Foundation

class LayerLayout {
    
    var name:String {
        // must override
        return ""
    }
    
    func layout(layers:[Layer]) {
        // must override
    }
    
    /**
     * We define our stacked graphs by layers atop a baseline.
     * This method does the work of assigning the positions of each layer in an
     * ordered array of layers based on an initial baseline.
     */
    func stackOnBaseline(layers:[Layer], baseline:[Double]) {
        var baseline = baseline
        for i in 0..<layers.count {
            let l = layers[i]
            l.yBottom = baseline
            for j in 0..<baseline.count {
                let nuvalue = baseline[i] - l.size[j]
                baseline[i] = nuvalue
            }
            l.yTop = baseline
        }
    }
    
    
}
