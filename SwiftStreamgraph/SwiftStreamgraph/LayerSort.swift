//
//  LayerSort.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//

import Foundation

class LayerSort {
    var name:String {
        return ""
    }
    
    func sort(layers:[Layer]) -> [Layer]? {
        return nil
    }
    
    
    
    /**
     * Creates a 'top' and 'bottom' collection.
     * Iterating through the previously sorted list of layers, place each layer
     * in whichever collection has less total mass, arriving at an evenly
     * weighted graph. Reassemble such that the layers that appeared earliest
     * end up in the 'center' of the graph.
     */
    
    func orderToOutside(layers:[Layer]) -> [Layer] {
        var j = 0
        let n = layers.count
        var newLayers = [Layer]()
        var topCount = 0
        var topSum = 0.0
        var topList = Array(0..<n)
        var botCount = 0
        var botSum = 0.0
        var botList = Array(0..<n)
        for i in 0..<n {
            if(topSum < botSum){
                topCount += 1
                topList[topCount] = i
                topSum += layers[i].sum
            } else {
                botCount += 1
                botList[botCount] = i
                botSum += layers[i].sum
            }
        }
    
        for i in (0...(botCount - 1)).reversed() {
            j += 1
            newLayers[j] = layers[botList[i]];
        }
        
        for i in 0..<topCount {
            j += 1
            newLayers[j] = layers[topList[i]]
        }
        
        return newLayers;
    }
}
