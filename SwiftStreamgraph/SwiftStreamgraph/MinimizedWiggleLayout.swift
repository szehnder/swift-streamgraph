//
//  MinimizedWiggleLayout.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//
import Foundation

class MinimizedWiggleLayout:LayerLayout {
    override var name:String {
        return "Minimized Wiggle Layout"
    }
    
    override func layout(layers:[Layer]) {
        let n = layers.first!.size.count
        let m = layers.count
        var baseline = [Double]()
        for i in 0..<n {
            baseline[i] = 0.0
        }
        
        for i in 0..<n {
            for j in 0..<m {
                var nuvalue = baseline[i]
                nuvalue += (Double(m) - Double(j) - 0.5) * layers[j].size[i]
                baseline[i] = nuvalue
            }
        }
        self.stackOnBaseline(layers: layers, baseline: baseline)
    }
}
