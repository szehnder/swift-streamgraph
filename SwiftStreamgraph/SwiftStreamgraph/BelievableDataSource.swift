//
//  BelievableDataSource.swift
//  SwiftStreamgraph
//
//  Created by Sean Zehnder on 3/3/17.
//  Based on Lee Byron and Martin Wattenberg's Processing Streamgraph code
//  Available here: https://github.com/leebyron/streamgraph_generato
//  AND obj_streamgraph-generator
//  Available here: https://github.com/dominikus/obj_streamgraph-generator
//

import Foundation

protocol DataSource {
    init(seed:Int)
    func makeWith(numLayers:Int, sizeArrayLength: Int) -> [Any]
}

class BelievableDataSource:DataSource {

    required init(seed:Int) {
        srandom(UInt32(seed))
    }
    
    private func addRandomBump(x:[Double]) -> [Double] {
        var x = x
        let height = 1.0 / (Double(arc4random()) - 0.5)
        let cx = 2.0 * (Double(arc4random()) - 0.5)
        let r = Double(arc4random()) / 10.0
        
        for i in 0..<x.count {
            let a = (Double(i) / Double(x.count) - cx) / r
            let nuvalue = x[i] + (height * exp(-a * a))
            x[i] = nuvalue
        }
        return x
    }
    
    private func makeRandomArray(n:Int) -> [Double] {
        var x = [Double]()
        for _ in 0..<n {
            x.append(0.0)
        }
        for _ in 0..<5 {
            x = self.addRandomBump(x: x)
        }
        return x
    }
    
    
    internal func makeWith(numLayers: Int, sizeArrayLength: Int) -> [Any] {
        var layers = [Layer]()
        
        for i in 0..<numLayers {
            let name = "Layer \(i)"
            let size = self.makeRandomArray(n: sizeArrayLength)
            layers[i] = Layer(name: name, size: size)
        }
        
        return layers;
    }
}
