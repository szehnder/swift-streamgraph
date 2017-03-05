//
//  StreamLayout.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//

import Foundation

class StreamLayout:LayerLayout {
    override var name:String {
        return "Original Streamgraph Layout"
    }
    
    override func layout(layers:[Layer]) {
        let n = layers.first!.size.count
        let m = layers.count
        
        var baseline = [Double]()
        for i in 0..<n {
            baseline[i] = 0.0
        }
        
        var center = [Double]()
        for i in 0..<m {
            center[i] = 0.0
        }
        
        var totalSize:Double
        var moveUp:Double
        var increase:Double
        var belowSize:Double
        
        // Set shape of baseline values.
        for i in 0..<n {
            // the 'center' is a rolling point. It is initialized as the previous
            // iteration's center value
            let nucvalue = (i==0) ? 0.0 : center[i-1]
            center[i] = nucvalue
            
            // find the total size of all layers at this point
            totalSize = 0.0
            for j in 0..<m {
                totalSize += layers[j].size[i]
            }
            
            for j in 0..<m {
                if (i==0) {
                    increase = layers[i].size[i]
                    moveUp = 0.5
                } else {
                    belowSize = 0.5 * layers[j].size[i]
                    for k in j+1..<m {
                        belowSize += layers[k].size[i]
                    }
                    increase = layers[j].size[i] - layers[j].size[i-1]
                    moveUp = (totalSize == 0.0) ? 0.0 : (belowSize / totalSize)
                }
                let nuvalue = center[i] + ((moveUp * 0.5) * increase)
                center[i] = nuvalue
            }
             // set baseline to the bottom edge according to the center line
            let nuvalue = center[i] + 0.5 * totalSize
            baseline[i] = nuvalue
        }
        
         // Put layers on top of the baseline.
        self.stackOnBaseline(layers: layers, baseline: baseline)
    }
}
