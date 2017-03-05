//
//  StackLayout.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//

import Foundation

class StackLayout:LayerLayout {
    override var name:String {
        return "Stacked Layout"
    }
    
    override func layout(layers:[Layer]) {
        let n = layers.first!.size.count
        var baseline = [Double]()
        for i in 0..<n {
            baseline[i] = 0.0
        }

        self.stackOnBaseline(layers: layers, baseline: baseline)
    }
}
